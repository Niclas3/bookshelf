local tools = require("utils")
local set= vim.o   --options
local g = vim.g    --global var
local cmd = vim.cmd -- commands
local M ={}
function M.setup()
        set.syntax = "on"

        --Set up leader key <leader>, i use default \
        -- let mapleader = ","
        g.mapleader = ","

        -- Disable mouse
        set.mouse = ""

        --""""""""""""""""""""""""""""""""""""""""     
        --" register Options
        --" if something error can touch this
        --" https://vi.stackexchange.com/questions/14486/what-does-it-mean-to-set-clipboard-unnamed
        --""""""""""""""""""""""""""""""""""""""""
        set.clipboard = "unnamed"

        --Auto reload changed files
        set.autoread = true

        --Always not change current directory to current-editing-file dir
        set.autochdir = false

        --Set character encoding to use in vim
        set.fileencodings="utf-8,gb18030,utf-16,big5"

        --Which EOL used. For us it's unix
        --Not works with modifiable=no
        if set.modifiable then
                set.fileformat = "unix"
        end

        --""""""""""""""""""""""""""""""""""""""""
        --" Display options
        --""""""""""""""""""""""""""""""""""""""""
        --" Hide showmode
        --" Showmode is useless with airline
        --set noshowmode
        --
        --" Show file name in window title
        set.title=true

        --" open preview window at bottom
        set.splitbelow=true

        --" Hide preview window for completion
        set.completeopt="menu"

        --" Mute error bell
        set.visualbell=true

        --" Remove all useless messages like intro screen and use abbreviation like RO
        --" instead readonly and + instead modified
        g.shortmess="atI"

        --" Enable display whitespace characters
        set.list=true

        --" Setting up how to display whitespace characters
        g.listchars=[[tab:⇥ ,trail:· ,extends:⋯ ,precedes:⋯ ,nbsp:~]]

        --" Wrap line only on characters in breakat list like ^I!@*-+;:,./?
        --" Useless with nowrap
        --" set linebreak
        --
        --" Numbers of lines to scroll when the cursor get off the screen
        --" Useless with scrolloff
        --" set scrolljump=5
        --
        --" Numbers of columns to scroll when the cursor get off the screen
        --" Useless with sidescrolloff
        --" set sidescroll=4

        --" Numbers of rows to keep to the up and to the bottom of the screen
        set.scrolloff=10
        --
        --" Numbers of columns to keep to the left and to the right off the screen
        set.sidescrolloff=10

        --" Vim will move to the previous/next line after reaching first/last char in 
        --" the line with this command (you can add 'h' or 'l' here as well) 
        --" <,> stand for arrows in command mode and [,] arrows in visual mode
        set.whichwrap="b,s,<,>,[,],"

        --" Display command which you typing and other command related stuff
        -- set.showcmd=true

        --" Indicate that last window have a statusline too
        set.laststatus=2

        --The cursor should stay where you leave it, instead of moving to the first non 
        --blank of the line
        -- maybe try `0
        set.startofline=false

        --" Disable wrapping long string
        set.wrap=false

        --Display Line numbers
        set.number = true

        --Highlight line with cursor
        set.cursorline=true

        --" Maximum text length at 80 symbols, vim automatically breaks longer lines
        set.textwidth=80

        --" Highlight column right after max textwidth
        set.colorcolumn="+1"

        --""""""""""""""""""""""""""""""""""""""""
        --" Tab options
        --""""""""""""""""""""""""""""""""""""""""
        --One tab equal 4 times space
        --Copy indent from previous line
        set.autoindent=true

        --Enable smart indent. It add additional indents when necessary
        set.smartindent=true

        --Replace tabs with spaces
        set.expandtab=true

        --When you hit tab at start of line, indent added according to shiftwidth value
        set.smarttab=true

        --Number of spaces to use for each step of indent
        set.shiftwidth=4

        --Same but for editing operation (not sure what exactly does it means)
        --but in most cases tabstop and softtabstop better be the same
        --read help file :help tabstop
        set.softtabstop=0

        --Number of spaces that a Tab in the file counts for
        set.tabstop=8
        --Round indent to multiple of 'shiftwidth'.
        --Indentation always be multiple of shiftwidth
        --Applies to  < and > command
        set.shiftround=true

        --""""""""""""""""""""""""""""""""""""""""
        --" Search options
        --""""""""""""""""""""""""""""""""""""""""
        --Add the g flag to search/replace by default/use gc 
        --		command		'gdefault' on	'gdefault' off	~
        --		:s///		  subst. all	  subst. one
        --		:s///g		  subst. one	  subst. all
        --		:s///gg		  subst. all	  subst. one
        -- g.gdefault=true

        --Highlight search results
        set.hlsearch=true

        --      pattern	'ignorecase'  'smartcase'	matches ~
        --	foo	  off		-		foo
        --	foo	  on		-		foo Foo FOO
        --	Foo	  on		off		foo Foo FOO
        --	Foo	  on		on		    Foo
        --	\cfoo	  -		-		foo Foo FOO
        --	foo\C	  -		-		foo
        --Ignore case in search patterns
        --foo Foo FOO
        set.ignorecase=true
        set.smartcase=false

        ----Live search. While typing a search command, show where the pattern
        set.incsearch=false

        --Disable highlighting search result on Enter key
        --nnoremap <silent> <leader>m :nohlsearch<cr><cr>
        tools.nnoremap('<leader>m', ':nohlsearch<cr>')

        --Show matching brackets
        set.showmatch=true

        --Make < and > match as well
        --(:), {:},[:],<:>
        local new_matchpairs = set.matchpairs .. ",<:>"
        set.matchpairs = new_matchpairs

        --""""""""""""""""""""""""""""""""""""""""
        --" Folding
        --""""""""""""""""""""""""""""""""""""""""

        --No fold closed at open file
        set.foldlevelstart=99
        set.foldenable=false

        --Keymap to toggle folds with space
        --nmap <space> za
        tools.nnoremap('<space>', "za")

        -- 
        -- vim.cmd([[
        --     augroup remember_folds
        --     autocmd!
        --     autocmd BufWinLeave * mkview
        --     autocmd BufWinEnter * silent! loadview
        --     augroup END
        -- ]])
        
        --""""""""""""""""""""""""""""""""""""""""
        --" Edit
        --""""""""""""""""""""""""""""""""""""""""

        --Allow backspace to remove indents, newlines and old text
        set.backspace="indent,eol,start"

        --Toggle paste mode on \p
        set.pastetoggle="<leader>p"

        --Add '-'and '+' as recognized word symbol.
        --E.g dw delete all 'foo-bar' instead just 'foo'
        --" foo+bar a
        -- local tmp_iskeyword = set.iskeyword .. ",-,+"
        -- set.iskeyword= tmp_iskeyword

        --Disable backups file default is backup
        set.backup=false

        --Disable vim common sequence for saving.
        --By default vim write buffer to a new file, then delete original file
        --then rename the new file.
        set.writebackup = false

        --Disable swp files
        set.swapfile = false

        --Do not add eol at the end of file.
        set.eol=false

        --Spellcheck
        set.spell = true
        set.spelllang="en_us"

        --Colorscheme
        cmd('colorscheme gruvbox')
        g.gruvbox_italic=1

        --plugins setting.
        require("config.rainbow_parentheses").setup()
        require("config.slimv").setup()
        require("config.supertab").setup()
        require("config.tagbar").setup()
        require("config.indentguides").setup()
        require("config.nerdtree").setup()
        require("config.airline").setup()
        require("config.treesitter").setup()
        require("config.telescope").setup()
end
return M

