; ":fennel_language_server"
(let [capabilities ((. (require :cmp_nvim_lsp) :default_capabilities))
      lspconfig (require :lspconfig)
      servers [:vimls]]
  (each [_ server (ipairs servers)]
    (match server
      :vimls
      ((. lspconfig server :setup) 
       {:default_config 
        {:filetypes [:vim]}
        })
      _ ((. lspconfig server :setup) {: capabilities}))))

