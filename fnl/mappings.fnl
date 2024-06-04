; (print "loading... mappings")
(let [wk (require :which-key)]
  (wk.register {:w {:name "Move between window"
                    :k [:<C-w><Up> "Cursor move up"]
                    :j [:<C-w><Down> "Cursor move down"]
                    :h [:<C-w><Left> "Cursor move left"]
                    :l [:<C-w><Right> "Cursor move right"]}
                :m [":nohlsearch<cr> :call clearmatches()<cr>" "Clear matches"]
                :q [":up<cr>:bd<cr>" "quit current tab"]
                :s ["<Plug>(easymotion-bd-f)" "easymotion jump"]
                :j ["<Plug>(easymotion-j)" "easymotion move up"]
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
  (wk.register {:a [::ClangdSwitchSourceHeader<cr> "jump between .c and .h"]}
               {:mode :n
                :prefix "<leader>"
                :buffer nil
                :silent true
                :noremap true
                :nowait false
                :expr false}))
