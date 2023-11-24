-- :fennel:1700837611
do end (require("luasnip.loaders.from_lua")).load({paths = "~/.config/nvim/snippets/"})
local ls = (require("luasnip")).config.set_config
return ls({enable_autosnippets = true, 
ext_opts = { 
    [(require("luasnip.util.types")).choiceNode] = {active = {virt_text = {{"@", "GruvboxOrange"}}}}}, history = true, updateevents = "TextChanged, TextChangedI"})
