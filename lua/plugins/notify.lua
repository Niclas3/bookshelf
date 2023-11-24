-- :fennel:1700839828
local notify_setup = (require("notify")).setup
local notify = require("notify")
notify_setup({active = true, on_config_done = nil, opts = {background_colour = "#000000", minimum_width = 50, on_close = nil, on_open = nil, render = "default", stages = "slide", timeout = 5000}})
vim.notify = notify
return nil