-- :fennel:1700840421
vim.o.syntax = "on"
vim.g.mapleader = ","
vim.o.mouse = ""
vim.o.clipboard = "unnamed"
vim.o.autoread = true
vim.o.autochdir = false
vim.o.fileencodings = "utf-8,gb18030,utf-16,big5"
if vim.o.modifiable then
  vim.o.fileformat = "unix"
else
end
vim.o.title = true
vim.o.splitbelow = true
vim.o.completeopt = "menu"
vim.o.visualbell = true
vim.g.shortmess = "atI"
vim.o.list = true
vim.g.listchars = "tab:\226\135\165 ,trail:\194\183 ,extends:\226\139\175 ,precedes:\226\139\175 ,nbsp:~"
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10
vim.o.whichwrap = "b,s,<,>,[,],"
vim.o.laststatus = 2
vim.o.startofline = false
vim.o.wrap = false
vim.o.number = true
vim.o.cursorline = true
vim.o.textwidth = 80
vim.o.colorcolumn = "+1"
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 0
vim.o.tabstop = 8
vim.o.shiftround = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = false
vim.o.incsearch = false
vim.o.showmatch = true
do
  local new_matchpairs = (vim.o.matchpairs .. ",<:>")
  vim.o.matchpairs = new_matchpairs
end
vim.o.foldlevelstart = 99
vim.o.foldenable = false
vim.o.backspace = "indent,eol,start"
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.eol = false
vim.o.spell = true
vim.o.spelllang = "en_us"
vim.cmd("colorscheme gruvbox")
vim.g.gruvbox_italic = 1
vim.o.termguicolors = true
do
  local result = vim.api.nvim_exec("let result = executable('clang-format')\n            if !result\n                echo '0'\n            else\n                echo '1'\n            endif\n        ", true)
  if (result == "1") then
    vim.api.nvim_exec("autocmd FileType c, nnoremap <leader>mc <cmd>:w <bar> !clang-format -i %<cr>\n        ", true)
  else
    print("clang-format is not executable, please install it. ")
  end
end
vim.api.nvim_exec("hi def IlluminatedWordText gui=underline\n                    hi def IlluminatedWordRead gui=underline\n                    hi def IlluminatedWordWrite gui=underline", true)
require("plugins/lsp")
require("plugins/luasnip")
require("plugins/lsp_cmp")
require("plugins/nvim-cmp")
require("plugins/which-key")
require("plugins/nerdtree")
require("plugins/rainbow_parentheses")
require("plugins/barbar")
require("plugins/lsp_signature")
require("plugins/vista")
require("plugins/indentguides")
require("plugins/telescope")
require("plugins/oil")
require("plugins/treesitter")
require("plugins/trouble")
require("plugins/notify")
require("plugins/wilder")
return require("plugins/supertab")