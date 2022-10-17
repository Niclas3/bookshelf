local M = {}

-- *noremap
local function noremap(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end
-- *map
local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = false, silent = true })
end

function M.nnoremap(shortcut, command)
  noremap('n', shortcut, command)
end

function M.inoremap(shortcut, command)
  noremap('i', shortcut, command)
end

function M.vnoremap(shortcut, command)
  noremap('v', shortcut, command)
end

function M.cnoremap(shortcut, command)
  noremap('c', shortcut, command)
end

function M.tnoremap(shortcut, command)
  noremap('t', shortcut, command)
end

return M

