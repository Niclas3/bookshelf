local M = {}
function M.setup()

    local icons = require("icons")
    local defaults = {
    active = true,
    on_config_done = nil,
    opts = {
        ---@usage Animation style one of { "fade", "slide", "fade_in_slide_out", "static" }
        stages = "slide",

        ---@usage Function called when a new window is opened, use for changing win settings/config
        on_open = nil,

        ---@usage Function called when a window is closed
        on_close = nil,

        ---@usage timeout for notifications in ms, default 5000
        timeout = 5000,

        -- Render function for notifications. See notify-render()
        render = "default",

        ---@usage highlight behind the window for stages that change opacity
        background_colour = "#000000",

        ---@usage minimum width for notification windows
        minimum_width = 50,

        ---@usage Icons for the different levels
        icons = {
        ERROR = icons.diagnostics.Error,
        WARN = icons.diagnostics.Warning,
        INFO = icons.diagnostics.Information,
        DEBUG = icons.diagnostics.Debug,
        TRACE = icons.diagnostics.Trace,
        },
    },
    }

    local status_ok, notify = pcall(require, "notify")
    if not status_ok then
        return
    end
    local opts = defaults

    notify.setup(opts)
    vim.notify = notify
end

return M
