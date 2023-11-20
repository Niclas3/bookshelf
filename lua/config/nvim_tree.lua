local tools = require("utils")
local M = {}
function M.setup()
    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    -- OR setup with some options
    require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    })

    tools.nnoremap('<leader>f', ':NvimTreeToggle<CR>')
end

return M
