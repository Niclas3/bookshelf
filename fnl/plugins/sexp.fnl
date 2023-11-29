(set vim.g.sexp_filetypes "clojure,scheme,lisp,timl,fennel,janet,racket") 

(let [wk (require :which-key)]
  (wk.register {
                :a {:name "Sexp object select"
                    :f ["<Plug>(sexp_outer_list)" "Select [count] outer list"]
                    :F ["<Plug>(sexp_outer_top_list)" "select top list"]
                    :s ["<Plug>(sexp_outer_string)" ""]
                    :e ["<Plug>(sexp_outer_element)" ""]}
                :o ["<Plug>(sexp_raise_list)" ""]
                :O ["<Plug>(sexp_raise_element)" ""]
                }
               {:mode :v
                :prefix :<LocalLeader>
                :buffer nil
                :silent true
                :noremap true
                :nowait false
                :expr false}))


(let [wk (require :which-key)]
  (wk.register {
                :<M-k> ["<Plug>(sexp_swap_list_backward)" "Move list backward"]
                :<M-j> ["<Plug>(sexp_swap_list_forward)" "Move list forward"]
                :<M-h> ["<Plug>(sexp_swap_element_backward)" "Move element backward"]
                :<M-l> ["<Plug>(sexp_swap_element_forward)" "Move element forward"]
                :<M-i> ["<Plug>(sexp_convolute)" "??"]
                :<M-u> ["<Plug>(sexp_splice_list)" "Remove 1 level ()"]
                :<M-S-j> ["<Plug>(sexp_emit_head_element)" "Pop head element"]
                :<M-S-k> ["<Plug>(sexp_emit_tail_element)" "Pop tail element"]
                :<M-S-h> ["<Plug>(sexp_capture_prev_element)" "fetch prev element"]
                :<M-S-l> ["<Plug>(sexp_capture_next_element)" "fetch next element"]
                }
               {:mode :n
                :prefix ""
                :buffer nil
                :silent true
                :noremap true
                :nowait false
                :expr false}))
