local M = {}
local trouble = require('trouble')
function M.setup()
    trouble.icons = false
    trouble.fold_open = "v"  -- icon used for open folds
    trouble.fold_closed = ">"  -- icon used for closed folds
    trouble.indent_lines = false  -- add an indent guide below the fold icons
    trouble.signs = {
        -- icons / text used for a diagnostic
        error = "error" ,
        warning = "warn" ,
        hint = "hint" ,
        information = "info"
    } 
    trouble.use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client

    vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})
    vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", {silent = true, noremap = true})
    vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true, noremap = true})
    vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", {silent = true, noremap = true})
    vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", {silent = true, noremap = true})
    vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", {silent = true, noremap = true})
end

return M
