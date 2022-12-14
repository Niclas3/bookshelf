local utils = require('utils')
local M = {}
function M.setup()
        vim.cmd('noremap <C-b> :noh<cr>:call clearmatches()<cr>') -- clear matches Ctrl+b
        -- nnoremap(shortcut, command)
        -- inoremap(shortcut, command)
        -- vnoremap(shortcut, command)
        -- cnoremap(shortcut, command)
        -- tnoremap(shortcut, command)

        --Moving between splits
        --nmap <leader>w <C-w>w
        utils.nnoremap('<leader>w', "<C-w>ww")
        utils.nnoremap('<leader>wk', "<C-w><Up>")
        utils.nnoremap('<leader>wj', "<C-w><Down>")
        utils.nnoremap('<leader>wh', "<C-w><Left>")
        utils.nnoremap('<leader>wl', "<C-w><Right>")
        utils.nnoremap('<leader>h', ":syntax on<CR>")

        --"toggle tabs
        --nnoremap <leader>b :bnext<CR>
        utils.nnoremap('<leader>b', ":bnext<CR>")

        --" quit tab
        --nnoremap <leader>q :w<CR>:bd<CR>
        utils.nnoremap('<leader>q', ":w<CR>:bd<CR>")
        --" Run rust
        utils.nnoremap('<leader>r', "<cmd>:RustRun<cr>")
        --" Compile rust
        utils.nnoremap('<leader>c', "<cmd>!cargo build -v<cr>")

        --" FORMAT THINGS"
        --" Format C codes 
        -- !!You should install clang-format
        -- e.g. sudo apt-get install clang-format
        local result = vim.api.nvim_exec(
            [[
                let result = executable('clang-format')
                if !result
                    echo '0'
                else
                    echo '1'
                endif
            ]],
            true)
        if(result == "1")
        then
            vim.api.nvim_exec(
            [[
                autocmd FileType c, nnoremap <leader>mc <cmd>:w <bar> !clang-format -i %<cr>
            ]], true)
            -- utils.nnoremap('<leader>mc', "<cmd>!clang-format -i %<cr>")
        else
            print("clang-format is not executable, please install it.")
        end

end
return M
