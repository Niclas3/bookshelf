-- :fennel:1700832039
local lsp_signature_setup = (require("lsp_signature")).setup
local function _1_()
  return false
end
return lsp_signature_setup({auto_close_after = nil, bind = true, close_timeout = 4000, doc_lines = 10, extra_trigger_chars = {}, floating_window = true, floating_window_above_cur_line = true, floating_window_off_x = 1, floating_window_off_y = 0, handler_opts = {border = "rounded"}, hi_parameter = "LspSignatureActiveParameter", hint_enable = true, hint_inline = _1_, hint_prefix = "\240\159\144\184 ", hint_scheme = "String", log_path = (vim.fn.stdpath("cache") .. "/lsp_signature.log"), max_height = 12, max_width = 80, move_cursor_key = nil, padding = "", select_signature_key = nil, shadow_blend = 36, shadow_guibg = "Black", timer_interval = 200, toggle_key = nil, transparency = nil, wrap = true, zindex = 200, toggle_key_flip_floatwin_setting = false, verbose = false, noice = false, fix_pos = false, debug = false, always_trigger = false})