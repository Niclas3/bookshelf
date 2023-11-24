;;kien/rainbow_parentheses.vim
(set vim.g.rbpt_colorpairs {1 [:brown :RoyalBlue3]
                            2 [:darkgray    :DarkOrchid3]
                            3 [:darkgreen   :firebrick3]
                            4 [:darkcyan    :RoyalBlue3]
                            5 [:darkred     :SeaGreen3]
                            6 [:darkmagenta :DarkOrchid3]
                            7 [:brown       :firebrick3]
                            8 [:gray        :RoyalBlue3]
                            9 [:black       :SeaGreen3]
                            10 [:darkmagenta :DarkOrchid3]
                            11 [:Darkblue    :firebrick3]
                            12 [:darkgreen   :RoyalBlue3]
                            13 [:darkcyan    :SeaGreen3]
                            14 [:darkred     :DarkOrchid3]
                            15 [:red         :firebrick3]})
(set vim.g.rbpt_max 9)
(set vim.g.rbpt_loadcmd_toggle 0)
(vim.cmd "au VimEnter * RainbowParenthesesToggle")
