; (print "loading... settings")
; Global settings 
(set vim.o.syntax "on")
;;Set up leader key <leader>, i use default \
(set vim.g.mapleader ",")
;; disable mouse
(set vim.o.mouse  "")
;;""""""""""""""""""""""""""""""""""""""""·····
;;" register Options
;;" if something error can touch this
;;" https://vi.stackexchange.com/questions/14486/what-does-it-mean-to-set-clipboard-unnamed
(set vim.o.clipboard "unnamed")
;;""""""""""""""""""""""""""""""""""""""""
;;Auto reload changed files
(set vim.o.autoread true)
;; Always not change current directory to current-editing-file dir
(set vim.o.autochdir  false)
;;Set character encoding to use in vim
(set vim.o.fileencodings "utf-8,gb18030,utf-16,big5")

;;Which EOL used. For us it's unix
;;Not works with modifiable=no
(when vim.o.modifiable 
      (set vim.o.fileformat "unix"))

;;""""""""""""""""""""""""""""""""""""""""
;;" Display options
;;""""""""""""""""""""""""""""""""""""""""
;;" Show file name in window title
(set vim.o.title true)

;;" open preview window at bottom
(set vim.o.splitbelow true) 

;;" Hide preview window for completion
(set vim.o.completeopt "menu") 

;;" Mute error bell
(set vim.o.visualbell true) 

;;" Remove all useless messages like intro screen and use abbreviation like RO
;;" instead readonly and + instead modified
(set vim.g.shortmess "atI") 

;;" Enable display whitespace characters
(set vim.o.list true) 

;;" Setting up how to display whitespace characters
(set vim.g.listchars "tab:⇥ ,trail:· ,extends:⋯ ,precedes:⋯ ,nbsp:~")

;;" Wrap line only on characters in breakat list like ^I!@*-+;:,./?
;;" Useless with nowrap
;;" set linebreak
;;
;;" Numbers of lines to scroll when the cursor get off the screen
;;" Useless with scrolloff
;;" set scrolljump=5
;;
;;" Numbers of columns to scroll when the cursor get off the screen
;;" Useless with sidescrolloff
;;" set sidescroll=4

;;" Numbers of rows to keep to the up and to the bottom of the screen
(set vim.o.scrolloff 10) 
;;
;;" Numbers of columns to keep to the left and to the right off the screen
(set vim.o.sidescrolloff 10) 

;;" Vim will move to the previous/next line after reaching first/last char in 
;;" the line with this command (you can add 'h' or 'l' here as well) 
;;" <,> stand for arrows in command mode and [,] arrows in visual mode
(set vim.o.whichwrap "b,s,<,>,[,],") 

;;" Display command which you typing and other command related stuff
;; set.showcmd=true

;;" Indicate that last window have a statusline too
(set vim.o.laststatus 2) 

;;The cursor should stay where you leave it, instead of moving to the first non 
;;blank of the line
;; maybe try `0
(set vim.o.startofline false) 

;;" Disable wrapping long string
(set vim.o.wrap false) 

;;Display Line numbers
(set vim.o.number   true) 

;;Highlight line with cursor
(set vim.o.cursorline true) 

;;" Maximum text length at 80 symbols, vim automatically breaks longer lines
(set vim.o.textwidth 80) 

;;" Highlight column right after max textwidth
(set vim.o.colorcolumn "+1") 

;;""""""""""""""""""""""""""""""""""""""""
;;" Tab options
;;""""""""""""""""""""""""""""""""""""""""
;;One tab equal 4 times space
;;Copy indent from previous line
(set vim.o.autoindent true) 

;;Enable smart indent. It add additional indents when necessary
(set vim.o.smartindent true) 

;;Replace tabs with spaces
(set vim.o.expandtab true) 

;;When you hit tab at start of line, indent added according to shiftwidth value
(set vim.o.smarttab true) 

;;Number of spaces to use for each step of indent
(set vim.o.shiftwidth 4) 

;;Same but for editing operation (not sure what exactly does it means)
;;but in most cases tabstop and softtabstop better be the same
;;read help file :help tabstop
(set vim.o.softtabstop 0) 

;;Number of spaces that a Tab in the file counts for
(set vim.o.tabstop 8) 
;;Round indent to multiple of 'shiftwidth'.
;;Indentation always be multiple of shiftwidth
;;Applies to  < and > command
(set vim.o.shiftround true) 

;;""""""""""""""""""""""""""""""""""""""""
;;" Search options
;;""""""""""""""""""""""""""""""""""""""""
;;Add the g flag to search/replace by default/use gc 
;;		command		'gdefault' on	'gdefault' off	~
;;		:s///		  subst. all	  subst. one
;;		:s///g		  subst. one	  subst. all
;;		:s///gg		  subst. all	  subst. one
;; g.gdefault=true

;;Highlight search results
(set vim.o.hlsearch true) 

;;      pattern	'ignorecase'  'smartcase'	matches ~
;;	foo	  off		-		foo
;;	foo	  on		-		foo Foo FOO
;;	Foo	  on		off		foo Foo FOO
;;	Foo	  on		on		    Foo
;;	\cfoo	  -		-		foo Foo FOO
;;	foo\C	  -		-		foo
;;Ignore case in search patterns
;;foo Foo FOO
(set vim.o.ignorecase true) 
(set vim.o.smartcase false) 

;;;;Live search. While typing a search command, show where the pattern
(set vim.o.incsearch false) 

;;Show matching brackets
(set vim.o.showmatch true) 

;;Make < and > match as well
;;(:), {:},[:],<:>
;;local new_matchpairs = set.matchpairs .. ",<:>"
(let [new_matchpairs (.. vim.o.matchpairs ",<:>")]
        (set vim.o.matchpairs   new_matchpairs))

;;""""""""""""""""""""""""""""""""""""""""
;;" Folding
;;""""""""""""""""""""""""""""""""""""""""

;;No fold closed at open file
(set vim.o.foldlevelstart 99) 
(set vim.o.foldenable false) 

;; 
;; vim.cmd([[
;;     augroup remember_folds
;;     autocmd!
;;     autocmd BufWinLeave * mkview
;;     autocmd BufWinEnter * silent! loadview
;;     augroup END
;; ]])

;;""""""""""""""""""""""""""""""""""""""""
;;" Edit
;;""""""""""""""""""""""""""""""""""""""""

;;Allow backspace to remove indents, newlines and old text
(set vim.o.backspace "indent,eol,start") 

;;Toggle paste mode on \p
;; set.pastetoggle="<leader>p"

;;Add '-'and '+' as recognized word symbol.
;;E.g dw delete all 'foo-bar' instead just 'foo'
;;" foo+bar a
;; local tmp_iskeyword = set.iskeyword .. ",-,+"
;; set.iskeyword= tmp_iskeyword

;;Disable backups file default is backup
(set vim.o.backup false) 

;;Disable vim common sequence for saving.
;;By default vim write buffer to a new file, then delete original file
;;then rename the new file.
(set vim.o.writebackup   false) 

;;Disable swp files
(set vim.o.swapfile   false) 

;;Do not add eol at the end of file.
(set vim.o.eol false) 

;;Spellcheck
(set vim.o.spell   true) 
(set vim.o.spelllang "en_us") 

;;Colorscheme
(vim.cmd "colorscheme gruvbox")
;;cmd('colorscheme gruvbox')
(set vim.g.gruvbox_italic 1) 
(set vim.o.termguicolors   true) 

;;" FORMAT THINGS"
;;" Format C codes 
;; !!You should install clang-format
;; e.g. sudo apt-get install clang-format
; (let [result (vim.api.nvim_exec "let result = executable('clang-format')
;             if !result
;                 echo '0'
;             else
;                 echo '1'
;             endif
;         " true)]
; (if (= result :1) (vim.api.nvim_exec "autocmd FileType c, nnoremap <leader>mc <cmd>:w <bar> !clang-format -i %<cr>
;         " true)
;     (print "clang-format is not executable, please install it. "))) 
;
;set highlight
(vim.api.nvim_exec "hi def IlluminatedWordText gui=underline
                    hi def IlluminatedWordRead gui=underline
                    hi def IlluminatedWordWrite gui=underline" true)	

;; plugins settings
(require :plugins/lsp)
(require :plugins/luasnip)
(require :plugins/lsp_cmp)
(require :plugins/nvim-cmp)
(require :plugins/which-key)
(require :plugins/nerdtree)
(require :plugins/rainbow_parentheses)
(require :plugins/barbar)
(require :plugins/lsp_signature)
(require :plugins/vista)
(require :plugins/indentguides)
(require :plugins/telescope)
(require :plugins/oil)
(require :plugins/treesitter)
(require :plugins/trouble)
(require :plugins/notify)
(require :plugins/wilder)
(require :plugins/supertab)
(require :plugins/neoformat)


