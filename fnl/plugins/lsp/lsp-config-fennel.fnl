; ":fennel_language_server"
(let [capabilities ((. (require :cmp_nvim_lsp) :default_capabilities))
      lspconfig (require :lspconfig)
      servers [:fennel_ls]]
  (each [_ server (ipairs servers)]
    (match server
      :fennel_ls
      ((. lspconfig server :setup) 
       {:default_config 
        {:filetypes [:fennel]
         :root_dir (lspconfig.util.root_pattern :fnl)
         :settings {:fennel {:diagnostics {:globals [:vim :jit :comment]}
                             :workspace {:library (vim.api.nvim_list_runtime_paths)}}}
                                                     :single_file_support true}})
      _ ((. lspconfig server :setup) {: capabilities}))))

