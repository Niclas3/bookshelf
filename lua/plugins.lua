require("lazy").setup({
    -- LSP
     'neovim/nvim-lspconfig', -- Configurations for Nvim LSP
     "hrsh7th/nvim-cmp",      -- autocomplate
     'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
     'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
     'L3MON4D3/LuaSnip', -- Snippets plugin
     'simrat39/rust-tools.nvim', --rust
     'shirk/vim-gas', -- nasm syntax

    -- for code signature
     "ray-x/lsp_signature.nvim",

    --Vim plugin for automatically highlighting other uses of the word under
    -- the cursor using either LSP, Tree-sitter, or regex matching.
     "RRethy/vim-illuminate",

    -- These optional plugins should be loaded directly because of a bug in Packer lazy loading
     'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
     'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status

    --barbar.nvim is a tabline plugin with re-orderable, auto-sizing, clickable tabs, icons, nice highlighting, sort-by commands and a magic jump-to-buffer mode. Plus the tab names are made unique when two filenames match.
     'romgrk/barbar.nvim',

    --The goal of nvim-treesitter is both to provide a simple and easy 
    -- way to  the interface for tree-sitter in Neovim and to 
    -- provide some basic functionality such as highlighting based on it:
     {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
     },
    --Telescope
    -- telescope.nvim is a highly extendable fuzzy finder over lists.
    -- Built on the latest awesome features from neovim core. Telescope is 
    -- centered around modularity, allowing for easy customization.
     {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.3',
        requires = { {'nvim-lua/plenary.nvim'} }
     },
    --wilder wilder.nvim adds new features and capabilities to wildmenu.
     {
        'gelguy/wilder.nvim'
     },

     {'nvim-lua/plenary.nvim'},
    -- Debugging
     {'mfussenegger/nvim-dap'}, --debuggy things.
     { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} },
     {"theHamsta/nvim-dap-virtual-text"}, -- require("nvim-dap-virtual-text").setup()
     { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" },
    --  "Pocco81/DAPInstall.nvim"
    -- Colorscheme ------------------------------
     { "morhetz/gruvbox" },
    --The goal of nvim-bqf is to make Neovim's quickfix window better.
     {'kevinhwang91/nvim-bqf'},

    -- notify
     "rcarriga/nvim-notify",
    -- Nice statusline / ruler for vim
     { 'vim-airline/vim-airline' },
     { 'vim-airline/vim-airline-themes'},
    ---------------------------------------------
    -- *** Add smart commands for comments like:
    -- gcc - Toggle comment for the current line
    -- gc  - Toggle comments for selected region or number of strings
    -- Very useful
     { 'tomtom/tcomment_vim' },
    --  Lisp slimv 
     { 'kovisoft/slimv' },

    -- navigate mark 
     {'kshenoy/vim-signature'},

    -- Easymotion test
     { 'easymotion/vim-easymotion' },

    -- RainBoww Parentheses
     { 'kien/rainbow_parentheses.vim' },
    -- Startup screen
     -- {
     --  "goolord/alpha-nvim",
     --   config = function()
     --    require("config.alpha").setup()
     --  end,
     -- },

    -- Allow autoclose paired characters like [,] or (,),
    -- and add smart cursor positioning inside it,
     { 'Raimondi/delimitMate' },

    -- "Supertab is a vim plugin which allows you to 
    -- " <Tab> for all your insert completion needs
     { 'ervandew/supertab' },
    
    --scrooloose/nerdtree
    -- *** Great file system explorer, it appears when you open dir in vim
    -- Allow modification of dir, and may other things
    -- Must have
     { 'scrooloose/nerdtree' },
     -- 'nvim-tree/nvim-tree.lua',
     --obsolete
     {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
     },
    -- Vim-expand-region is a Vim plugin that allows you to 
    -- visually select increasingly larger regions of text 
    -- using the same key combination.
     { 'terryma/vim-expand-region' },

    -- ** right hand function or class view by tag
    --  { 'majutsushi/tagbar' }

     "liuchengxu/vista.vim",

    -- Simple indentation guides for buffers
     { 'thaerkh/vim-indentguides' },

    -- Multiple cursors
     { 'terryma/vim-multiple-cursors' },

    -- tpope/vim-surround
    -- ** Add usefull hotkey for operation with surroundings
    -- cs{what}{towhat} - inside '' or [] or something like this allow
    -- change surroundings symbols to another
    -- and ds{what} - remove them
    -- Now with the cursor on "Hello", press ysiw] (iw is a text object).
     { 'tpope/vim-surround' }
})

