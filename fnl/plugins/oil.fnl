;stevearc/oil.nvim
(let [wk (require :which-key)]
  (wk.register {
     :- ["<cmd>Oil<cr>" "Oil open parent directory"]
     }
    {
      :mode   "n"
      :prefix   ""
      :buffer   nil
      :silent  true
      :noremap   true
      :nowait   false
      :expr   false
    }))
(let [oil_setup (. (require :oil) :setup)]
  (oil_setup {:buf_options {:bufhidden :hide :buflisted false}
                            :cleanup_delay_ms 2000
                            :columns [:icon :size :mtime]
                            :default_file_explorer true
                            :delete_to_trash false
                            :float {:border :rounded
                                    :max_height 0
                                    :max_width 0
                                    :override (fn [conf] conf)
                                    :padding 2
                                    :win_options {:winblend 0}}
                            :keymaps {:- :actions.parent
                                      :<C-c> :actions.close
                                      :<C-h> :actions.select_split
                                      :<C-l> :actions.refresh
                                      :<C-p> :actions.preview
                                      :<C-s> :actions.select_vsplit
                                      :<C-t> :actions.select_tab
                                      :<CR> :actions.select
                                      :_ :actions.open_cwd
                                      "`" :actions.cd
                                      :g. :actions.toggle_hidden
                                      :g? :actions.show_help
                                      "g\\" :actions.toggle_trash
                                      :gs :actions.change_sort
                                      :gx :actions.open_external
                                      "~" :actions.tcd}
                            :preview {:border :rounded
                                      :height nil
                                      :max_height 0.9
                                      :max_width 0.9
                                      :min_height [5 0.1]
                                      :min_width [40 0.4]
                                      :width nil
                                      :win_options {:winblend 0}}
                            :progress {:border :rounded
                                       :height nil
                                       :max_height [10 0.9]
                                       :max_width 0.9
                                       :min_height [5 0.1]
                                       :min_width [40 0.4]
                                       :minimized_border :none
                                       :width nil
                                       :win_options {:winblend 0}}
                            :prompt_save_on_select_new_entry true
                            :skip_confirm_for_simple_edits false
                            :use_default_keymaps true
                            :view_options {:is_always_hidden (fn [name bufnr]
                                                               false)
                                           :is_hidden_file (fn [name bufnr]
                                                             (vim.startswith name
                                                                             "."))
                                           :show_hidden false
                                           :sort [[:type :asc] [:name :asc]]}
                            :win_options {:concealcursor :nvic
                                          :conceallevel 3
                                          :cursorcolumn false
                                          :foldcolumn :0
                                          :list false
                                          :signcolumn :no
                                          :spell false
                                          :wrap false}}

    )
  )

