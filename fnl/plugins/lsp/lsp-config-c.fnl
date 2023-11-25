(let [capabilities ((. (require :cmp_nvim_lsp) :default_capabilities))
      lspconfig (require :lspconfig)
      servers [:ccls :rust_analyzer :pyright :tsserver ]]
  (each [_ server (ipairs servers)]
    (match server
      :ccls ((. lspconfig server :setup)
             {:init_options 
              {:cache {:directory :.ccls-cache}
               :clang {:extraArgs [:-std=c11 :-I/home/zm/Development/C/Orange/src/core/include]}}}
             )
      _ ((. lspconfig server :setup)
         {: capabilities}))))
