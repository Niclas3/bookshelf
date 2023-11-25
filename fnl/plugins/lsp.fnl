; (print "    plugins/lsp")
(require :plugins/lsp/lsp-config-c)
(require :plugins/lsp/lsp-config-fennel)

(let [wk (require :which-key)]
  (wk.register {
                :d ["<cmd>lua vim.lsp.buf.definition()<cr>" "go to definition"]
                :D ["<cmd>lua vim.lsp.buf.declaration()<cr>" "go to declaration"]
                }
               {:mode :n
                :prefix :<leader>
                :buffer nil
                :silent true
                :noremap true
                :nowait false
                :expr false}))

; (let [wk (require :which-key)]
;   (wk.register {:<Space> [:za "fold exist folder"]}
;                {:mode :n
;                 :prefix ""
;                 :buffer nil
;                 :silent true
;                 :noremap true
;                 :nowait false
;                 :expr false}))
