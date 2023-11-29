; /liuchengxu/vista.vim
(let [wk (require :which-key)]
  (wk.register { :t ["<cmd>Vista!!<cr>" "Open Right side viewer"] }
    { :mode   "n"
      :prefix   "<leader>"
      :buffer   nil
      :silent  true
      :noremap   true
      :nowait   false
      :expr   false }))

(set vim.g.vista_icon_indent ["╰─▸ " "├─▸ "])

;;Executive used when opening vista sidebar without specifying it.
;;See all the avaliable executives via `:echo g:vista#executives`.
(set vim.g.vista_default_executive "ctags")

; Set the executive for some filetypes explicitly. Use the explicit executive
; instead of the default one for these filetypes when using `:Vista` without
; specifying the executive.
(set vim.g.vista_executive_for {:cpp :ctags ;; this for header like *.h file
                                :c   :ctags
                                :fnl :fnl
                                :vim_lsp :vim_lsp
                                })

