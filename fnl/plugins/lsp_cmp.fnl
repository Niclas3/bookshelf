(let [cmp_setup (. (require :cmp) :setup)
      cmp (require :cmp)
      luasnip (require :luasnip)]
  (cmp_setup {:mapping (cmp.mapping.preset.insert {
                                                   ; :<C-Space> (cmp.mapping.complete)
                                                   :<CR> (cmp.mapping (fn [fallback]
                                                                        (if (cmp.visible)
                                                                          (cmp.confirm)
                                                                          (fallback))))
                                                   :<S-Tab> (cmp.mapping (fn [fallback]
                                                                           (if (cmp.visible)
                                                                               (cmp.select_prev_item)
                                                                               (luasnip.jumpable (- 1))
                                                                               (luasnip.jump (- 1))
                                                                               (fallback)))
                                                                         [:i
                                                                          :s])
                                                   :<Tab> (cmp.mapping (fn [fallback]
                                                                         (if (cmp.visible)
                                                                             (cmp.select_next_item)
                                                                             (luasnip.expand_or_jumpable)
                                                                             (luasnip.expand_or_jump)
                                                                             (fallback)))
                                                                       [:i :s])
                                                   })
              :snippet {:expand (fn [args] (luasnip.lsp_expand args.body))}
              :sources [{:name :nvim_lsp} 
                        {:name :luasnip} 
                        {:name :path}
                        ]}
             ))
