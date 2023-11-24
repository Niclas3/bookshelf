-- :fennel:1700825763
local lazy = require("lazy")
return lazy.setup({"udayvir-singh/tangerine.nvim", "neovim/nvim-lspconfig", "hrsh7th/nvim-cmp", "hrsh7th/cmp-nvim-lsp", "saadparwaiz1/cmp_luasnip", "L3MON4D3/LuaSnip", "simrat39/rust-tools.nvim", "shirk/vim-gas", "bakpakin/fennel.vim", "ray-x/lsp_signature.nvim", "RRethy/vim-illuminate", "nvim-tree/nvim-web-devicons", "lewis6991/gitsigns.nvim", "romgrk/barbar.nvim", {{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}}, "nvim-lua/plenary.nvim", {{"nvim-telescope/telescope.nvim", tag = "0.1.3", requires = {{"nvim-lua/plenary.nvim"}}}}, "gelguy/wilder.nvim", "mfussenegger/nvim-dap", {{"rcarriga/nvim-dap-ui", requires = {{"mfussenegger/nvim-dap"}}}}, "theHamsta/nvim-dap-virtual-text", {{"folke/trouble.nvim", requires = {{"kyazdani42/nvim-web-devicons"}}}}, "morhetz/gruvbox", "kevinhwang91/nvim-bqf", "rcarriga/nvim-notify", "vim-airline/vim-airline", "vim-airline/vim-airline-themes", "tomtom/tcomment_vim", "kovisoft/slimv", "kshenoy/vim-signature", "easymotion/vim-easymotion", "kien/rainbow_parentheses.vim", "Raimondi/delimitMate", "ervandew/supertab", "scrooloose/nerdtree", {{"stevearc/oil.nvim", dependencies = {"nvim-tree/nvim-web-devicons"}}}, "terryma/vim-expand-region", "liuchengxu/vista.vim", "thaerkh/vim-indentguides", "terryma/vim-multiple-cursors", "tpope/vim-surround", "folke/which-key.nvim"}, {performance = {reset_packpath = false}})