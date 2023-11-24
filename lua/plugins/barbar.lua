-- :fennel:1700831351
do
  local wk = require("which-key")
  wk.register({v = {"<Cmd>BufferPrevious<CR>", "Barbar move to previous tab"}, b = {"<Cmd>BufferNext<CR>", "Barbar move to next tab"}, ["1"] = {"<Cmd>BufferGoto 1<CR>", "Barbar move to 1st tab"}, ["2"] = {"<Cmd>BufferGoto 2<CR>", "Barbar move to 2nd tab"}, ["3"] = {"<Cmd>BufferGoto 3<CR>", "Barbar move to 3rd tab"}, ["4"] = {"<Cmd>BufferGoto 4<CR>", "Barbar move to 4th tab"}, ["5"] = {"<Cmd>BufferGoto 5<CR>", "Barbar move to 5th tab"}, ["6"] = {"<Cmd>BufferGoto 6<CR>", "Barbar move to 6th tab"}, ["7"] = {"<Cmd>BufferGoto 7<CR>", "Barbar move to 7th tab"}, ["8"] = {"<Cmd>BufferGoto 8<CR>", "Barbar move to 8th tab"}, ["9"] = {"<Cmd>BufferGoto 9<CR>", "Barbar move to 9th tab"}, ["0"] = {"<Cmd>BufferLast<CR>", "Barbar move to last tab"}, ["<C-p>"] = {"<Cmd>BufferPick<CR>", "Barbar Pick some tab"}}, {mode = "n", prefix = "<leader>", buffer = nil, silent = true, noremap = true, expr = false, nowait = false})
end
local wk = require("which-key")
return wk.register({["<C-p>"] = {"<Cmd>BufferPick<CR>", "Barbar Pick some tab"}}, {mode = "n", prefix = "", buffer = nil, silent = true, noremap = true, expr = false, nowait = false})