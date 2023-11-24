-- :fennel:1700826230
local wk = require("which-key")
return wk.register({f = {":NERDTreeToggle<CR>", "NERDTree switcher"}}, {mode = "n", prefix = "<leader>", buffer = nil, silent = true, noremap = true, expr = false, nowait = false})