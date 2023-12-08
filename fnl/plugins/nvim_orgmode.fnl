(let [org_mode (require :orgmode)
      nts (. (require :nvim-treesitter.configs) :setup)]
  ((. org_mode :setup_ts_grammar))
  (nts {:hightlight {:enable true :additional_vim_regex_highlighting [:org]}
        :ensure_installed [:org]})
  ((. org_mode :setup) {:org_agenda_files "~/orgfiles/**/*"
                        :org_default_notes_file "~/orgfiles/refile.org"}))
