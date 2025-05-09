(local v-select-str (require :../utils/utils))

(let [telescope (require :telescope)
      t_notify ((. (require :telescope) :load_extension) :notify)
      actions (require :telescope.actions)
      trouble (require :trouble.sources.telescope)]
  ((. telescope :setup) {:defaults {:mappings {:i {:<c-t> trouble.open}
                                               :n {:<c-t> trouble.open}}}}))

(fn grep_visual_selection []
  (let [text (v-select-str)
        grep_str (. (require :telescope.builtin) :grep_string)]
    (grep_str {:search (. text 1)})))

(fn grep_search_reg []
  (let [text (vim.fn.getreg "/")
        grep_str (. (require :telescope.builtin) :grep_string)]
    (grep_str {:search text})))

(let [wk (require :which-key)]
  (wk.register {:g {:name "Telescope things"
                    :f ["<cmd>Telescope find_files<cr>" "Telescope find files"]
                    :g ["<cmd>Telescope live_grep<cr>" "Telescope grep things"]
                    :b ["<cmd>Telescope buffers<cr>"
                        "Telescope show all buffers"]
                    :h ["<cmd>Telescope help_tags<cr>" "Telescope show help"]
                    :s ["<cmd>Telescope git_commits<cr>"
                        "Telescope show git commits"]
                    :e [grep_search_reg "grep string at search register"]}}
               {:mode :n
                :prefix :<leader>
                :buffer nil
                :silent true
                :noremap true
                :nowait false
                :expr false}))

(let [wk (require :which-key)]
  (wk.register {:g {:name "Telescope things"
                    :e [grep_visual_selection
                        "grep selected string in visual mode"]}}
               {:mode :v
                :prefix :<leader>
                :buffer nil
                :silent true
                :noremap true
                :nowait false
                :expr false}))
