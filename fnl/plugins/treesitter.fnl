;nvim-treesitter/nvim-treesitter
(let [treesitter_setup (. (require :nvim-treesitter.configs) :setup)]
  (treesitter_setup {:auto_install true
                     :ensure_installed [:c :lua :rust :javascript :racket]
                     :highlight {:additional_vim_regex_highlighting false
                                 :disable (fn [lang buf]
                                            (local max-filesize (* 100 1024))
                                            (local (ok stats)
                                                   (pcall vim.loop.fs_stat
                                                          (vim.api.nvim_buf_get_name buf)))
                                            (when (and (and ok stats)
                                                       (> stats.size
                                                          max-filesize))
                                              true))
                                 :enable true}
                     :sync_install false
                     :incremental_selection {:enable true
                                             :keymaps {:init_selection :<C-space>
                                                       :node_incremental :<C-space>
                                                       :scope_incremental false
                                                       :node_decremental :<bs>}}}))

(vim.api.nvim_create_autocmd [:BufEnter
                              :BufAdd
                              :BufNew
                              :BufNewFile
                              :BufWinEnter]
                             {:callback (fn [] (set vim.opt.foldmethod :expr)
                                          (set vim.opt.foldexpr
                                               "nvim_treesitter#foldexpr()"))
                              :group (vim.api.nvim_create_augroup :TS_FOLD_WORKAROUND
                                                                  {})})
