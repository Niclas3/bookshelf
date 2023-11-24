;folke/trouble.nvim
(let [trouble (require :trouble)]
  (set trouble.icons false)
  (set trouble.fold_open :v)
  (set trouble.fold_closed ">")
  (set trouble.indent_lines false)
  (set trouble.signs {:error :error
                    :hint :hint
                    :information :info
                    :warning :warn})
  (set trouble.use_diagnostic_signs false))

(let [wk (require :which-key)]
  (wk.register {
     :x {:name "Trouble show bugs"
         :x ["<cmd>TroubleToggle<cr>" "Trouble !"]
         :w ["<cmd>TroubleToggle workspace_diagnostics<cr>" "Trouble workspace"]
         :d ["<cmd>TroubleToggle document_diagnostics<cr>" "Trouble doc"]
         :l ["<cmd>TroubleToggle loclist<cr>" "Trouble loclist???"]}
         :q ["<cmd>TroubleToggle quickfix<cr>" "Trouble quickfix window"] 
     }
    {
      :mode   "n"
      :prefix   "<leader>"
      :buffer   nil
      :silent  true
      :noremap   true
      :nowait   false
      :expr   false
    }))

