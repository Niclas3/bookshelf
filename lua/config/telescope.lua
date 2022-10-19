local M = {}
local tool = require('utils')
local builtin = require('telescope.builtin')
local telescope = require("telescope")
require("telescope").load_extension("notify")

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

function M.setup()
    telescope.setup {
        defaults = {
            mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
            },
        },
    }
    tool.nnoremap("<leader>gf", "<cmd>Telescope find_files<cr>")
    tool.nnoremap("<leader>gg", "<cmd>Telescope live_grep<cr>")
    tool.nnoremap("<leader>gb", "<cmd>Telescope buffers<cr>")
    tool.nnoremap("<leader>gh", "<cmd>Telescope help_tags<cr>")
    tool.nnoremap("<leader>gs", "<cmd>Telescope git_commits<cr>")
end
return M
