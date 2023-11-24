-- :fennel:1700834686
do
  local telescope = require("telescope")
  local t_notify = (require("telescope")).load_extension("notify")
  local actions = require("telescope.actions")
  local trouble = require("trouble.providers.telescope")
  telescope.setup({defaults = {mappings = {i = {["<c-t>"] = trouble.open_with_trouble}, n = {["<c-t>"] = trouble.open_with_trouble}}}})
end
local wk = require("which-key")
return wk.register({g = {name = "Telescope things", f = {"<cmd>Telescope find_files<cr>", "Telescope find files"}, g = {"<cmd>Telescope live_grep<cr>", "Telescope grep things"}, b = {"<cmd>Telescope buffers<cr>", "Telescope show all buffers"}, h = {"<cmd>Telescope help_tags<cr>", "Telescope show help"}, s = {"<cmd>Telescope git_commits<cr>", "Telescope show git commits"}}}, {mode = "n", prefix = "<leader>", buffer = nil, silent = true, noremap = true, expr = false, nowait = false})