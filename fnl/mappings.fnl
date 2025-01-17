; (print "loading... mappings")
(fn clear_hl []
  (set vim.o.hlsearch false))

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

(fn safe_get [func mode name]
  (local status (pcall func name))
  (when status
    (if (= mode :v)
        (func name))))

(fn min [arg1 arg2]
  (if (> arg1 arg2)
    arg2
    arg1))
(fn max [arg1 arg2]
  (if (< arg1 arg2)
    arg2
    arg1))

(fn extruct_row_col [pos]
  [(. pos 2) (. pos 3)])

(fn sort_row_cols [point1 point2]
  (let [po1_row (. point1 1)
        po1_col (. point1 2)
        po2_row (. point2 1)
        po2_col (. point2 2)]
    [(min po1_row po2_row)
    (min po1_col po2_col)
    (max po1_row po2_row)
    (max po1_col po2_col)]))

(fn copy2sys []
  (let [visual_pos (vim.fn.getpos "v")
        cur_pos (vim.fn.getpos :.)
        result_table (sort_row_cols (extruct_row_col visual_pos) (extruct_row_col cur_pos))
        s_row (. result_table 1)
        s_col (. result_table 2)
        e_row (. result_table 3)
        e_col (. result_table 4)]
    (let [str (vim.api.nvim_buf_get_text 0 (- s_row 1) (- s_col 1) (- e_row 1) (- e_col 0) {})]
      (vim.fn.setreg :+ str))))

(let [wk (require :which-key)]
  (wk.register {:y [copy2sys "copy select buffer to system clipboard"]}
               {:mode :v
                :prefix :<leader>
                :buffer nil
                :silent true
                :noremap true
                :nowait false
                :expr false}))

(local highlight_word (fn []
                        (let [word (vim.fn.expand :<cword>)]
                          (vim.fn.setreg "/" word)
                          (set vim.o.hlsearch true))))

; map for lsp
(let [wk (require :which-key)]
  (wk.register {:d ["<cmd>lua vim.lsp.buf.definition()<cr>" "go to definition"]
                :D ["<cmd>lua vim.lsp.buf.declaration()<cr>" "go to declaration"]
                :r [highlight_word "highlight cursor words"]}
               {:mode :n
                :prefix :<leader>
                :buffer nil
                :silent true
                :noremap true
                :nowait false
                :expr false}))
