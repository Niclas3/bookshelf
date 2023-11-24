-- :fennel:1700831419
do
  local wk = require("which-key")
  wk.register({w = {name = "Move between window", k = {"<C-w><Up>", "Cursor move up"}, j = {"<C-w><Down>", "Cursor move down"}, h = {"<C-w><Left>", "Cursor move left"}, l = {"<C-w><Right>", "Cursor move right"}}, m = {":nohlsearch<cr> :call clearmatches()<cr>", "Clear matches"}, d = {"<C-]>", "go to definition"}, q = {":w<cr>:bd<cr>", "quit current tab"}, s = {"<Plug>(easymotion-bd-f)", "easymotion jump"}, j = {"<Plug>(easymotion-j)", "easymotion move up"}, k = {"<Plug>(easymotion-k)", "easymotion move down"}}, {mode = "n", prefix = "<leader>", buffer = nil, silent = true, noremap = true, expr = false, nowait = false})
end
local wk = require("which-key")
return wk.register({["<Space>"] = {"za", "fold exist folder"}}, {mode = "n", prefix = "", buffer = nil, silent = true, noremap = true, expr = false, nowait = false})