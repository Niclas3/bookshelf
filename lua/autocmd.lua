local M = {}
function M.setup()
vim.cmd([[
""""""""""""""""""""""""""""""""""""""""
" Autocmd
""""""""""""""""""""""""""""""""""""""""
" It executes specific command when specific events occured
" like reading or writing file, or open or close buffer
if has("autocmd")
    " Define group of commands,
    " Commands defined in .vimrc don't bind twice if .vimrc will reload
    augroup vimrc
    " Delete any previously defined autocommands
    au!
        "Auto reload vim after your change it and reload airline
        "au BufWritePost *.vim source $MYVIMRC "| AirlineRefresh
        au BufWritePost .vimrc source $MYVIMRC " | AirlineRefresh
        "read jack file
        " au BufRead,BufNewFile *.jack set filetype=jack
        " au BufRead,BufNewFile *.stc set filetype=cel

        " Restore cursor position :help last-position-jump
        au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
          \| exe "normal g'\"" | endif

        " Set filetypes aliases
        au FileType htmldjango set ft=html.htmldjango
        au FileType scss set ft=scss.css
        au FileType less set ft=less.css
        au BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax clear | endif
        "au BufEnter,InsertEnter * :syntax on
        au BufRead,BufNewFile *.js set ft=javascript
        au BufRead,BufNewFile *.json set ft=json
        au BufRead,BufNewFile *.swift set ft=swift
        " Execute python \ -mjson.tool for autoformatting *.json

        " Auto close preview window, it uses with tags,
        " I don't use it
        autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
        autocmd InsertLeave * if pumvisible() == 0|pclose|endif
        "autocmd BufWritePost *.ts,*.tsx call tslint#run('a', win_getid())

        " Disable vertical line at max string length in NERDTree
        autocmd FileType * setlocal colorcolumn=+1
        autocmd FileType nerdtree setlocal colorcolumn=""

        " Not enable Folding - it really slow on large files, uses plugin vim-javascript-syntax
        " au FileType javascript* call JavaScriptFold()
        au FileType html let b:loaded_delimitMate = 1
        au FileType handlebars let b:loaded_delimitMate = 1

    " Group end
    augroup END

    " for hex editing
    augroup Binary
        au!
        au BufReadPre  *.bin let &bin=1
        au BufReadPost *.bin if &bin | %!xxd
        au BufReadPost *.bin set ft=xxd | endif
        au BufWritePre *.bin if &bin | %!xxd -r
        au BufWritePre *.bin endif
        au BufWritePost *.bin if &bin | %!xxd
        au BufWritePost *.bin set nomod | endif
    augroup END
endif
]])
end
return M
