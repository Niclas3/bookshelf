; (print "loading... mappings")
(local TEMP_NAME_SPACE :temp_namespace)
(local TEMP_NS_VAR :temp_ns)
(fn clear_hl []
  (let [ns_id (vim.api.nvim_buf_get_var 0 TEMP_NS_VAR)
        clear_all_hl (fn [ns_id]
                       (vim.api.nvim_buf_clear_namespace 0 ns_id 0 -1))]
    (clear_all_hl ns_id)))

(let [wk (require :which-key)]
  (wk.register {:w {:name "Move between window"
                    :k [:<C-w><Up> "Cursor move up"]
                    :j [:<C-w><Down> "Cursor move down"]
                    :h [:<C-w><Left> "Cursor move left"]
                    :l [:<C-w><Right> "Cursor move right"]
                    :w [:<C-w>w "Cursor move next window"]}
                :m [clear_hl "Clear matches"]
                :q [":up<cr>:bd<cr>" "quit current tab"]
                :s ["<Plug>(easymotion-bd-f)" "easymotion jump"]
                :j ["<Plug>(easymotion-j)" "easymotion move up"]
                :r [(fn [] (print "test ")) "hight light word"]
                :k ["<Plug>(easymotion-k)" "easymotion move down"]}
               {:mode :n
                :prefix :<leader>
                :buffer nil
                :silent true
                :noremap true
                :nowait false
                :expr false}))

(let [wk (require :which-key)]
  (wk.register {:<Space> [:za "fold exist folder"]}
               {:mode :n
                :prefix ""
                :buffer nil
                :silent true
                :noremap true
                :nowait false
                :expr false}))

(let [wk (require :which-key)]
  (wk.register {:a [":ClangdSwitchSourceHeader<cr>" "jump between .c and .h"]}
               {:mode :n
                :prefix :<leader>
                :buffer nil
                :silent true
                :noremap true
                :nowait false
                :expr false}))

(fn find_word_position_at_line [line_no word]
  (let [line_str (_G.unpack (vim.api.nvim_buf_get_lines 0 (- line_no 1) line_no
                                                        false))]
    (line_str:find word)))

(fn highlight_line [ns_id hi_group row start_col end_col]
  (let [hi_group (or hi_group :Search)]
    (vim.api.nvim_buf_add_highlight 0 ns_id hi_group row start_col end_col)))

(local highlight_word
       (fn []
         (let [word (vim.fn.expand :<cword>)
               ns_id (vim.api.nvim_create_namespace TEMP_NAME_SPACE)
               line_count (vim.api.nvim_buf_line_count 0)]
           (vim.api.nvim_buf_set_var 0 TEMP_NS_VAR ns_id)
           (for [cur_row 1 line_count]
             (local (word_start word_end)
                    (find_word_position_at_line cur_row word))
             (if (and word_start word_end)
                 (highlight_line ns_id nil (- cur_row 1) (- word_start 1)
                                 word_end))))))

; map for lsp
(let [wk (require :which-key)]
  (wk.register {:d ["<cmd>lua vim.lsp.buf.definition()<cr>" "go to definition"]
                :D ["<cmd>lua vim.lsp.buf.declaration()<cr>"
                    "go to declaration"]
                :r [highlight_word "highlight cursor words"]}
               {:mode :n
                :prefix :<leader>
                :buffer nil
                :silent true
                :noremap true
                :nowait false
                :expr false}))
