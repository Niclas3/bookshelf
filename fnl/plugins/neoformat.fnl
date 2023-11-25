;/neoformat
(let [wk (require :which-key)]
  (wk.register {:m {:name "neoformat format code"
                    :c [:<cmd>Neoformat<cr> "Neoformat format code"]}}
               {:mode :n
                :prefix :<leader>
                :buffer nil
                :silent true
                :noremap true
                :nowait false
                :expr false}))
