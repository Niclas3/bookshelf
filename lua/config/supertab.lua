local M = {}

function M.setup()
    vim.cmd([[
            let g:SuperTabDefaultCompletionType = "<c-n>"
            let g:SuperTabContextDefaultCompletionType = "<c-n>"
    ]])
end

return M
