; "typescript"
(let [capabilities ((. (require :cmp_nvim_lsp) :default_capabilities))
      lspconfig (require :lspconfig)
      servers [:tsserver]]
  (each [_ server (ipairs servers)]
    (match server
      :tsserver
      ((. lspconfig server :setup) {} )
      _ ((. lspconfig server :setup) {: capabilities}))))
