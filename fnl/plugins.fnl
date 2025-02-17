; (print "loading... plugins")
(local lazy (or _G.lazy (require :lazy)))

(lazy.setup [;; fennel env
             :udayvir-singh/tangerine.nvim
             :udayvir-singh/hibiscus.nvim
             ;; font or style
             :echasnovski/mini.icons
             ;; LSP
             :neovim/nvim-lspconfig
             ;; Configurations for Nvim LSP
             :hrsh7th/nvim-cmp
             ;; autocomplate
             :hrsh7th/cmp-nvim-lsp
             ; complate path
             :hrsh7th/cmp-path
             ;; LSP source for nvim-cmp
             :saadparwaiz1/cmp_luasnip
             ;; Snippets source for nvim-cmp
             :L3MON4D3/LuaSnip
             ;; Snippets plugin
             :simrat39/rust-tools.nvim
             ;;rust
             :shirk/vim-gas
             ;;haskell This repository/plugin contains functions to help start a nvim-hs plugin as a separate process.
             :neovimhaskell/nvim-hs.vim
             ;;vim-textobj-user - Create your own text objects
             :kana/vim-textobj-user
             ;; agda
             ;; agda-mode in nvim
             [{1 :isovector/cornelis :do "stack build"}]
             ;; nasm syntax
             :bakpakin/fennel.vim
             ;Lisp things
             :Olical/conjure
             ;racket things
             :wlangstroth/vim-racket
             ;format code
             :sbdchd/neoformat
             ;fennel run time things
             :Olical/aniseed
             ;For code signature
             :ray-x/lsp_signature.nvim
             ;Vim-sexp brings the Vim philosophy of precision editing to S-expressions.
             :guns/vim-sexp
             ;tpope/vim-repeat
             ;;Vim plugin for automatically highlighting other uses of the word under
             ;; the cursor using either LSP, Tree-sitter, or regex matching.
             :RRethy/vim-illuminate
             ;; These optional plugins should be loaded directly because of a bug in Packer lazy loading
             :nvim-tree/nvim-web-devicons
             ;; OPTIONAL: for file icons
             :lewis6991/gitsigns.nvim
             ;; OPTIONAL: for git status
             ;;barbar.nvim is a tabline plugin with re-orderable, auto-sizing, clickable tabs, icons, nice highlighting, sort-by commands and a magic jump-to-buffer mode. Plus the tab names are made unique when two filenames match.
             :romgrk/barbar.nvim
             ;;The goal of nvim-treesitter is both to provide a simple and easy 
             ;; way to  the interface for tree-sitter in Neovim and to 
             ;; provide some basic functionality such as highlighting based on it:
             [{1 :nvim-treesitter/nvim-treesitter :build ":TSUpdate"}]
             ;;Telescope
             ;; telescope.nvim is a highly extendable fuzzy finder over lists.
             ;; Built on the latest awesome features from neovim core. Telescope is 
             ;; centered around modularity, allowing for easy customization.
             [{1 :nvim-telescope/telescope.nvim
               :tag :0.1.3
               :requires [[:nvim-lua/plenary.nvim]]}]
             ;;wilder wilder.nvim adds new features and capabilities to wildmenu.
             :gelguy/wilder.nvim
             ;; Debugging
             :mfussenegger/nvim-dap
             ;;debuggy things.
             [{1 :rcarriga/nvim-dap-ui :requires [[:mfussenegger/nvim-dap]]}]
             :theHamsta/nvim-dap-virtual-text
             ;; require("nvim-dap-virtual-text").setup()
             [{1 :folke/trouble.nvim
               :requires [[:kyazdani42/nvim-web-devicons]]}]
             ;; Colorscheme ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
             :morhetz/gruvbox
             ;;The goal of nvim-bqf is to make Neovim's quickfix window better.
             :kevinhwang91/nvim-bqf
             ;; notify refine
             :rcarriga/nvim-notify
             ;; some lib function
             :nvim-lua/plenary.nvim
             ; ;;UI Component Library for Neovim
             ; :MunifTanjim/nui.nvim
             ;; Nice statusline / ruler for vim
             :vim-airline/vim-airline
             :vim-airline/vim-airline-themes
             ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;-
             ;; *** Add smart commands for comments like:
             ;; gcc - Toggle comment for the current line
             ;; gc  - Toggle comments for selected region or number of strings
             ;; Very useful
             :tomtom/tcomment_vim
             ;;  Lisp slimv 
             :kovisoft/slimv
             ;; navigate mark 
             :kshenoy/vim-signature
             ;; Easymotion test
             :easymotion/vim-easymotion
             ;; RainBoww Parentheses
             :kien/rainbow_parentheses.vim
             ; :luochen1990/rainbow
             ;; Allow autoclose paired characters like [,] or (,),
             ;; and add smart cursor positioning inside it,
             ;; automatic closing of quotes
             :Raimondi/delimitMate
             ;; "Supertab is a vim plugin which allows you to 
             ;; " <Tab> for all your insert completion needs
             :ervandew/supertab
             ;;scrooloose/nerdtree
             ;; *** Great file system explorer, it appears when you open dir in vim
             ;; Allow modification of dir, and may other things
             ;; Must have
             :scrooloose/nerdtree
             ;;File system
             [{1 :stevearc/oil.nvim
               :dependencies [:nvim-tree/nvim-web-devicons]}]
             ;; Vim-expand-region is a Vim plugin that allows you to 
             ;; visually select increasingly larger regions of text 
             ;; using the same key combination.
             :terryma/vim-expand-region
             ;; ** right hand function or class view by tag
             :liuchengxu/vista.vim
             ;; Simple indentation guides for buffers
             :thaerkh/vim-indentguides
             ;; Multiple cursors
             :terryma/vim-multiple-cursors
             ;; Workflow
             ;; nvim-orgmode
             ; [{1 :nvim-orgmode/orgmode :event :VeryLazy}]
             ; [{1 :nvim-neorg/neorg
             ;   :build ":Neorg sync-parsers"
             ;   :dependencies [:nvim-lua/plenary.nvim]
             ;   ; :config (fn []
             ;   ;           (let [neorg_setup (. (require :neorg) :setup)]
             ;   ;             (neorg_setup {[:core.defaults] {}
             ;   ;                           [:core.norg.dirman] {:config {:workspaces {:example_gtd :/home/zm/Development/playground/routine_playground/example_workspaces/gtd}}}
             ;   ;                           [:core.gtd.base] {:config {:workspace :example_gtd}}})))
             ;   }]
             ;; tpope/vim-surround
             ;; ** Add usefull hotkey for operation with surroundings
             ;; cs{what}{towhat} - inside '' or [] or something like this allow
             ;; change surroundings symbols to another
             ;; and ds{what} - remove them
             ;; Now with the cursor on "Hello", press ysiw] (iw is a text object).
             :tpope/vim-surround
             ;; Keymapping 
             ;; https://github.com/folke/which-key.nvim 
             :folke/which-key.nvim
             ;---local plugin 
             [{1 :local/ants :dev true}]]
            {:performance {:reset_packpath false}
             :ui {:icons {:cmd "⌘"
                          :config "🛠"
                          :event "📅"
                          :ft "📂"
                          :init "⚙"
                          :keys "🗝"
                          :plugin "🔌"
                          :runtime "💻"
                          :require "🌙"
                          :source "📄"
                          :start "🚀"
                          :task "📌"
                          :lazy "💤 "}}
             :dev {:path :/home/zm/Development/neovim_plugin/code
                   :patterns {}
                   :fallback false}})
