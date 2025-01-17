; (let [capabilities ((. (require :cmp_nvim_lsp) :default_capabilities))
;       lspconfig (require :lspconfig)
;       servers [:ccls]]
;   (each [_ server (ipairs servers)]
;     (match server
;       :ccls ((. lspconfig server :setup)
;              {
;               :init_options 
;               {:cache {:directory :.ccls-cache}
;                :clang {:extraArgs [:-std=c23 :-I/home/zm/Development/C/Orange/src/core/include
;                                    :-I/lib/modules/6.2.0-37-generic/build/include
;                                    :-I/usr/include
;                                    ]}}
;               }
;              )
;       _ ((. lspconfig server :setup)
;          {: capabilities}))))

                                                       ; :-I/lib/modules/6.2.0-37-generic/build/include
                                                       ; :-I/usr/include

(let [ccls (. (require :lspconfig) :ccls)]
  ((. ccls :setup) {:init_options {:cache {:directory :.ccls-cache}
                                   :clang {:extraArgs [:-std=c21
                                                       :-I/home/zm/Development/C/Frog/src/core/include
                                                       :-I/home/zm/Development/C/Frog/src/core/arch/x86/include
                                                       ]}}}))

; (let [clangd (. (require :lspconfig) :clangd)]
;   ((. clangd :setup) {:init_options {:cache {:directory :.ccls-cache}
;                                      :clang {:extraArgs [:-std=c23
;                                                          :-I/home/zm/Development/C/Orange/src/core/include
;                                                          :-I/lib/modules/6.2.0-37-generic/build/include
;                                                          :-I/usr/include]}} }))
