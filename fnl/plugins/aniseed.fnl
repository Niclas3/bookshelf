;aniseed
; (let [a (require :aniseed.core)
;       nvim (require :aniseed.nvim)
;       new-split (lambda [name] (nvim.ex.vsplit name))]
;   (new-split :test))
;
(let [wk (require :which-key)]
  (wk.register {:<r> ["<cmd>AniseedEvalFile %<cr>" "aniseed eval file"]}
               {:mode :n
                :prefix "/"
                :buffer nil
                :silent true
                :noremap true
                :nowait false
                :expr false}))
