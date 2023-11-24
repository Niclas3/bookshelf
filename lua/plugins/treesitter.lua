-- :fennel:1700836323
do
  local treesitter_setup = (require("nvim-treesitter.configs")).setup
  local function _1_(lang, buf)
    local max_filesize = (100 * 1024)
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    if ((ok and stats) and (stats.size > max_filesize)) then
      return true
    else
      return nil
    end
  end
  treesitter_setup({auto_install = true, ensure_installed = {"c", "lua", "rust", "javascript", "racket"}, highlight = {disable = _1_, enable = true, additional_vim_regex_highlighting = false}, sync_install = false})
end
local function _3_()
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  return nil
end
return vim.api.nvim_create_autocmd({"BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter"}, {callback = _3_, group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {})})