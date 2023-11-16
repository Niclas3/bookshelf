-- " barbar.nvim
-- https://github.com/romgrk/barbar.nvim
local M = {}

function M.setup()
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Move to previous/next
    map('n', '<leader>v', '<Cmd>BufferPrevious<CR>', opts)
    map('n', '<leader>b', '<Cmd>BufferNext<CR>', opts)
    -- Re-order to previous/next
    -- map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
    -- map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
    -- Goto buffer in position...
    map('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', opts)
    -- map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
    -- map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
    -- map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
    -- map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
    -- map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
    -- map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
    -- map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
    -- map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
    -- map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
    -- Pin/unpin buffer
    -- map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
    -- Close buffer
    -- map('n', '<leader>q', '<cmd>BufferClose<CR>', opts)
    -- Wipeout buffer
    --                 :BufferWipeout
    -- Close commands
    --                 :BufferCloseAllButCurrent
    --                 :BufferCloseAllButPinned
    --                 :BufferCloseAllButCurrentOrPinned
    --                 :BufferCloseBuffersLeft
    --                 :BufferCloseBuffersRight
    -- Magic buffer-picking mode
    map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
    -- Sort automatically by...
    map('n', '<leader><Space>bb', '<cmd>BufferOrderByBufferNumber<CR>', opts)
    map('n', '<leader><Space>bd', '<cmd>BufferOrderByDirectory<CR>', opts)
    map('n', '<leader><Space>bl', '<cmd>BufferOrderByLanguage<CR>', opts)
    map('n', '<leader><Space>bw', '<cmd>BufferOrderByWindowNumber<CR>', opts)

    -- Other:
    -- :BarbarEnable - enables barbar (enabled by default)
    -- :BarbarDisable - very bad command, should never be used


end

return M

