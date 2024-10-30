; ":lua"
; (let [capabilities ((. (require :cmp_nvim_lsp) :default_capabilities))
;       lspconfig (require :lspconfig)
;       servers [:lua_ls]]
;   (each [_ server (ipairs servers)]
;     (match server
;       :lua_ls
;       ((. lspconfig server :setup) 
;        {:default_config 
;         {:filetypes [:lua]}
;         })
;       _ ((. lspconfig server :setup) {: capabilities}))))
((. (require :lspconfig) :lua_ls :setup) {:on_init (fn [client]
                                                     (when client.workspace_folders
                                                       (local path
                                                              (. client.workspace_folders
                                                                 1 :name))
                                                       (when (or (vim.uv.fs_stat (.. path
                                                                                     :/.luarc.json))
                                                                 (vim.uv.fs_stat (.. path
                                                                                     :/.luarc.jsonc)))
                                                         (lua "return ")))
                                                     (set client.config.settings.Lua
                                                          (vim.tbl_deep_extend :force
                                                                               client.config.settings.Lua
                                                                               {:runtime {:version :LuaJIT}
                                                                                :workspace {:checkThirdParty false
                                                                                            :library [vim.env.VIMRUNTIME]}})))
                                          :settings {:Lua {}}})
