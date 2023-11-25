(let [cmp_setup (. (require :cmp) :setup)
      cmp (require :cmp)
      luasnip (require :luasnip)]
  (cmp_setup {:mapping (cmp.mapping.preset.insert {:<C-Space> (cmp.mapping.complete)
                                                   :<C-d> (cmp.mapping.scroll_docs (- 4))
                                                   :<C-f> (cmp.mapping.scroll_docs 4)
                                                   :<CR> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Replace
                                                                               :select true})
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
                                                                       [:i :s])})
              :snippet {:expand (fn [args] (luasnip.lsp_expand args.body))}
              :sources [{:name :nvim_lsp} {:name :luasnip}]}))
