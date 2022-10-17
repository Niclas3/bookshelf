local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }
    -- Configurations for Nvim LSP
    use 'neovim/nvim-lspconfig' 
    -- Colorscheme ------------------------------
    use { "morhetz/gruvbox" }
    -- Nice statusline / ruler for vim
    use { 'vim-airline/vim-airline' }
    use { 'vim-airline/vim-airline-themes'}
    ---------------------------------------------
    -- *** Add smart commands for comments like:
    -- gcc - Toggle comment for the current line
    -- gc  - Toggle comments for selected region or number of strings
    -- Very useful
    use { 'tomtom/tcomment_vim' }
    --  Lisp slimv 
    use { 'kovisoft/slimv' }

    -- navigate mark 
    use {'kshenoy/vim-signature'} 

    -- Easymotion test
    use { 'easymotion/vim-easymotion' }

    -- RainBoww Parentheses
    use { 'kien/rainbow_parentheses.vim' }
    -- Startup screen
    use {
      "goolord/alpha-nvim",
      config = function()
        require("config.alpha").setup()
      end,
    }

    -- Allow autoclose paired characters like [,] or (,),
    -- and add smart cursor positioning inside it,
    use { 'Raimondi/delimitMate' }

    -- "Supertab is a vim plugin which allows you to 
    -- "use <Tab> for all your insert completion needs
    use { 'ervandew/supertab' }
    --scrooloose/nerdtree
    -- *** Great file system explorer, it appears when you open dir in vim
    -- Allow modification of dir, and may other things
    -- Must have
    use { 'scrooloose/nerdtree' }

    -- Vim-expand-region is a Vim plugin that allows you to 
    -- visually select increasingly larger regions of text 
    -- using the same key combination.
    use { 'terryma/vim-expand-region' }

    -- ** right hand function or class view by tag
    use { 'majutsushi/tagbar' }

    -- Simple indentation guides for buffers
    use { 'thaerkh/vim-indentguides' }

    -- Multiple cursors
    use { 'terryma/vim-multiple-cursors' }

    -- tpope/vim-surround
    -- ** Add usefull hotkey for operation with surroundings
    -- cs{what}{towhat} - inside '' or [] or something like this allow
    -- change surroundings symbols to another
    -- and ds{what} - remove them
    -- Now with the cursor on "Hello", press ysiw] (iw is a text object).
    use { 'tpope/vim-surround' }

    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
