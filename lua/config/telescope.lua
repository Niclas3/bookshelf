local M = {}
local tool = require('utils')
local builtin = require('telescope.builtin')
require("telescope").load_extension("notify")

function M.setup()
    tool.nnoremap("<leader>gf", "<cmd>Telescope find_files<cr>")
    tool.nnoremap("<leader>gg", "<cmd>Telescope live_grep<cr>")
    tool.nnoremap("<leader>gb", "<cmd>Telescope buffers<cr>")
    tool.nnoremap("<leader>gh", "<cmd>Telescope help_tags<cr>")
    tool.nnoremap("<leader>gs", "<cmd>Telescope git_commits<cr>")
end
return M
