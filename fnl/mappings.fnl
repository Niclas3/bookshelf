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

(fn copy2sys []
  (let [start_pos (vim.fn.getpos "v")
        end_pos (vim.fn.getpos :.)
        s_row (. start_pos 2)
        s_col (. start_pos 3)
        e_row (. end_pos 2)
        e_col (. end_pos 3) ]
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
