local utils = require('utils')
local M = {}
function M.setup()
        vim.cmd('noremap <C-b> :noh<cr>:call clearmatches()<cr>') -- clear matches Ctrl+b
        -- nnoremap(shortcut, command)
        -- inoremap(shortcut, command)
        -- vnoremap(shortcut, command)
        -- cnoremap(shortcut, command)
        -- tnoremap(shortcut, command)

        --Moving between splits
        --nmap <leader>w <C-w>w
        utils.nnoremap('<leader>w', "<C-w>w")
        -- utils.nnoremap('<leader>wk', "<C-w><Up>")
        -- utils.nnoremap('<leader>wj', "<C-w><Down>")
        utils.nnoremap('<leader>h', ":syntax on<CR>")

        --"toggle tabs
        --nnoremap <leader>b :bnext<CR>
        utils.nnoremap('<leader>b', ":bnext<CR>")

        --" quit tab
        --nnoremap <leader>q :w<CR>:bd<CR>
        utils.nnoremap('<leader>q', ":w<CR>:bd<CR>")
end
return M
