(let [telescope (require :telescope)
      t_notify ((. (require :telescope) :load_extension) :notify)
      actions (require :telescope.actions)
      trouble (require :trouble.providers.telescope)
      ]
  ( (. telescope :setup) {:defaults  
                          {:mappings  {:i  {:<c-t> trouble.open_with_trouble}
                                       :n  {:<c-t> trouble.open_with_trouble}}}}))

(let [wk (require :which-key)]
  (wk.register {
     :g {:name "Telescope things"
         :f ["<cmd>Telescope find_files<cr>" "Telescope find files"]
         :g ["<cmd>Telescope live_grep<cr>" "Telescope grep things"]
         :b ["<cmd>Telescope buffers<cr>" "Telescope show all buffers"]
         :h ["<cmd>Telescope help_tags<cr>" "Telescope show help"]
         :s ["<cmd>Telescope git_commits<cr>" "Telescope show git commits"] 
         }
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
