-- ~/.config/nvim/plugin/0-tangerine.lua or ~/.config/nvim/init.lua
-- pick your plugin manager
local pack =  "lazy"

local function bootstrap(url, ref)
    local name = url:gsub(".*/", "")
    local path

    if pack == "lazy" then
        path = vim.fn.stdpath("data") .. "/lazy/" .. name
        vim.opt.rtp:prepend(path)
    else
        path = vim.fn.stdpath("data") .. "/site/pack/".. pack .. "/start/" .. name
    end

    if vim.fn.isdirectory(path) == 0 then
        print(name .. ": installing in data dir...")

        vim.fn.system {"git", "clone", url, path}
        if ref then
            vim.fn.system {"git", "-C", path, "checkout", ref}
        end

        vim.cmd "redraw"
        print(name .. ": finished installing")
    end
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- for stable version [recommended]
bootstrap("https://github.com/udayvir-singh/tangerine.nvim", "v2.8")
 
local nvim_dir = vim.fn.stdpath("config")
require "tangerine".setup {
     vimrc   = nvim_dir .. "/init.fnl",
     source  = nvim_dir .. "/fnl",
     target  = nvim_dir .. "/lua",
     --target = vim.fn.stdpath [[data]] .. "/tangerine",
     -- compile files in &rtp
     rtpdirs = {
     },
     compiler = {
        -- enable popup showing compiled files
        verbose = true,

        -- compile every time you change fennel files or on entering vim
        hooks = {"onsave", "oninit"}
    }
}
vim.opt.rtp:prepend(nvim_dir .. "/lua")

require("tangerine_vimrc")

