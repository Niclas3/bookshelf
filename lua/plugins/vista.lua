-- :fennel:1700833066
do
  local wk = require("which-key")
  wk.register({t = {"<cmd>Vista!!<cr>", "Open Right side viewer"}}, {mode = "n", prefix = "<leader>", buffer = nil, silent = true, noremap = true, expr = false, nowait = false})
end
vim.g.vista_icon_indent = {"\226\149\176\226\148\128\226\150\184 ", "\226\148\156\226\148\128\226\150\184 "}
vim.g.vista_default_executive = "ctags"
vim.g.vista_executive_for = {cpp = "vim_lsp", fnl = "vim_lsp"}
return nil