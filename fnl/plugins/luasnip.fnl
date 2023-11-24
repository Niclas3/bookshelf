; :L3MON4D3/LuaSnip

((. (require :luasnip.loaders.from_lua) :load) {:paths "~/.config/nvim/snippets/"})
(let [ls (. (require :luasnip) :config :set_config)]
  (ls {:enable_autosnippets true
                       :ext_opts {(. (require :luasnip.util.types) :choiceNode) 
                                  {:active {:virt_text [["@" :GruvboxOrange]]}}}
                       :history true
                       :updateevents "TextChanged, TextChangedI"})	
  )
