-- :fennel:1700827164
vim.g.rbpt_colorpairs = {{"brown", "RoyalBlue3"}, {"darkgray", "DarkOrchid3"}, {"darkgreen", "firebrick3"}, {"darkcyan", "RoyalBlue3"}, {"darkred", "SeaGreen3"}, {"darkmagenta", "DarkOrchid3"}, {"brown", "firebrick3"}, {"gray", "RoyalBlue3"}, {"black", "SeaGreen3"}, {"darkmagenta", "DarkOrchid3"}, {"Darkblue", "firebrick3"}, {"darkgreen", "RoyalBlue3"}, {"darkcyan", "SeaGreen3"}, {"darkred", "DarkOrchid3"}, {"red", "firebrick3"}}
vim.g.rbpt_max = 9
vim.g.rbpt_loadcmd_toggle = 0
return vim.cmd("au VimEnter * RainbowParenthesesToggle")