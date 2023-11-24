-- :fennel:1700835440
do
  local wk = require("which-key")
  wk.register({["-"] = {"<cmd>Oil<cr>", "Oil open parent directory"}}, {mode = "n", prefix = "", buffer = nil, silent = true, noremap = true, expr = false, nowait = false})
end
local oil_setup = (require("oil")).setup
local function _1_(conf)
  return conf
end
local function _2_(name, bufnr)
  return false
end
local function _3_(name, bufnr)
  return vim.startswith(name, ".")
end
return oil_setup({buf_options = {bufhidden = "hide", buflisted = false}, cleanup_delay_ms = 2000, columns = {"icon", "size", "mtime"}, default_file_explorer = true, float = {border = "rounded", max_height = 0, max_width = 0, override = _1_, padding = 2, win_options = {winblend = 0}}, keymaps = {["-"] = "actions.parent", ["<C-c>"] = "actions.close", ["<C-h>"] = "actions.select_split", ["<C-l>"] = "actions.refresh", ["<C-p>"] = "actions.preview", ["<C-s>"] = "actions.select_vsplit", ["<C-t>"] = "actions.select_tab", ["<CR>"] = "actions.select", _ = "actions.open_cwd", ["`"] = "actions.cd", ["g."] = "actions.toggle_hidden", ["g?"] = "actions.show_help", ["g\\"] = "actions.toggle_trash", gs = "actions.change_sort", gx = "actions.open_external", ["~"] = "actions.tcd"}, preview = {border = "rounded", height = nil, max_height = 0.9, max_width = 0.9, min_height = {5, 0.1}, min_width = {40, 0.4}, width = nil, win_options = {winblend = 0}}, progress = {border = "rounded", height = nil, max_height = {10, 0.9}, max_width = 0.9, min_height = {5, 0.1}, min_width = {40, 0.4}, minimized_border = "none", width = nil, win_options = {winblend = 0}}, prompt_save_on_select_new_entry = true, use_default_keymaps = true, view_options = {is_always_hidden = _2_, is_hidden_file = _3_, sort = {{"type", "asc"}, {"name", "asc"}}, show_hidden = false}, win_options = {concealcursor = "nvic", conceallevel = 3, foldcolumn = "0", signcolumn = "no", cursorcolumn = false, list = false, wrap = false, spell = false}, delete_to_trash = false, skip_confirm_for_simple_edits = false})