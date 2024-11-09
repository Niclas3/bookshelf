; (print "    plugins/lsp")
(require :plugins/lsp/lsp-config-c)
(require :plugins/lsp/lsp-config-fennel)
(require :plugins/lsp/lsp-config-vimscript)
(require :plugins/lsp/lsp-config-lua)
(require :plugins/lsp/lsp-config-ts)


; (let [wk (require :which-key)]
;   (wk.register {:<Space> [:za "fold exist folder"]}
;                {:mode :n
;                 :prefix ""
;                 :buffer nil
;                 :silent true
;                 :noremap true
;                 :nowait false
;                 :expr false}))
