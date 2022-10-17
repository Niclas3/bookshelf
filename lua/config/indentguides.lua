local M = {}

function M.setup()
    vim.cmd([[
        let g:indentguides_ignorelist = ['text']
    ]])
end

return M
