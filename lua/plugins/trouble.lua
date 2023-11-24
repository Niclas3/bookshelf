-- :fennel:1700836776
do
  local trouble = require("trouble")
  trouble.icons = false
  trouble.fold_open = "v"
  trouble.fold_closed = ">"
  trouble.indent_lines = false
  trouble.signs = {error = "error", hint = "hint", information = "info", warning = "warn"}
  trouble.use_diagnostic_signs = false
end
local wk = require("which-key")
return wk.register({x = {name = "Trouble show bugs", x = {"<cmd>TroubleToggle<cr>", "Trouble !"}, w = {"<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble workspace"}, d = {"<cmd>TroubleToggle document_diagnostics<cr>", "Trouble doc"}, l = {"<cmd>TroubleToggle loclist<cr>", "Trouble loclist???"}}, q = {"<cmd>TroubleToggle quickfix<cr>", "Trouble quickfix window"}}, {mode = "n", prefix = "<leader>", buffer = nil, silent = true, noremap = true, expr = false, nowait = false})