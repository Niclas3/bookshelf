; ":lua"
(let [capabilities ((. (require :cmp_nvim_lsp) :default_capabilities))
      lspconfig (require :lspconfig)
      servers [:lua_ls]]
  (each [_ server (ipairs servers)]
    (match server
      :lua_ls
      ((. lspconfig server :setup) 
       {:default_config 
        {:filetypes [:lua]}
        })
      _ ((. lspconfig server :setup) {: capabilities}))))
