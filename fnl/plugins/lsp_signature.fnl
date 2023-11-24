;ray-x/lsp_signature.nvim
(let [lsp_signature_setup (. (require :lsp_signature) :setup)]
  (lsp_signature_setup {:always_trigger false
             :auto_close_after nil
             :bind true
             :close_timeout 4000
             :debug false
             :doc_lines 10
             :extra_trigger_chars {}
             :fix_pos false
             :floating_window true
             :floating_window_above_cur_line true
             :floating_window_off_x 1
             :floating_window_off_y 0
             :handler_opts {:border :rounded}
             :hi_parameter :LspSignatureActiveParameter
             :hint_enable true
             :hint_inline (fn [] false)
             :hint_prefix "🐸 "
             :hint_scheme :String
             :log_path (.. (vim.fn.stdpath :cache) :/lsp_signature.log)
             :max_height 12
             :max_width 80
             :move_cursor_key nil
             :noice false
             :padding ""
             :select_signature_key nil
             :shadow_blend 36
             :shadow_guibg :Black
             :timer_interval 200
             :toggle_key nil
             :toggle_key_flip_floatwin_setting false
             :transparency nil
             :verbose false
             :wrap true
             :zindex 200}))
