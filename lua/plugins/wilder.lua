-- :fennel:1700840314
local wilder_setup = (require("wilder")).setup
local wilder = require("wilder")
wilder_setup({modes = {":", "/", "?"}})
wilder.set_option("pipeline", {wilder.branch(wilder.cmdline_pipeline(), wilder.search_pipeline())})
return wilder.set_option("renderer", wilder.wildmenu_renderer({highlighter = wilder.basic_highlighter()}))