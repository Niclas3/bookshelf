local M ={}
local dap = require("dap")
local dapui = require("dapui")
local tools = require('utils')
local repl = require 'dap.repl'
function M.setup()
    dap.adapters.lldb = {
        type = 'executable',
        command = '/usr/local/opt/llvm/bin/lldb-vscode',
        name = 'lldb'
    }
    dap.configurations.cpp= {
    {
        name = 'niclas debugger',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/deps/', 'file')
        end,
        -- cwd = '${workspaceFolder}',
        -- stopOnEntry = false,
        args = {}
        -- args = { 
        --     "cargo", 
        --     "build",
        --     "-v",
        -- },

        -- 💀
        -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
        --
        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        --
        -- Otherwise you might get the following error:
        --
        --    Error on launch: Failed to attach to the target process
        --
        -- But you should be aware of the implications:
        -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
        -- runInTerminal = false,
    },
}
        -- If you want to use this for Rust and C, add something like this:

        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
        repl.commands = vim.tbl_extend('force', repl.commands, {
            -- Add a new alias for the existing .exit command
            exit = {'exit', '.exit', '.bye'},
            -- next = {'n'},
            -- continue= {'c'},
            -- Add your own commands; run `.echo hello world` to invoke
            -- this function with the text "hello world"
            custom_commands = {
              ['.echo'] = function(text)
                dap.repl.append(text)
              end,
              -- Hook up a new command to an existing dap function
              ['.restart'] = dap.restart,
            },
        })
        tools.nnoremap('<leader>B','<cmd>:DapToggleBreakpoint<cr>')
        tools.nnoremap('<leader>dr','<cmd>:DapContinue<cr>')
        tools.nnoremap('<leader>S','<cmd>:DapStepInto<cr>')
        tools.nnoremap('<leader>N','<cmd>:DapStepOver<cr>')
        tools.nnoremap('<leader>dq','<cmd>:DapTerminate<cr>')
end

return M
