local M = {}

function M.setup()
    vim.cmd([[
            " Automatically displays all buffers
            " when there's only one tab open.
            let g:airline#extensions#tabline#enabled = 1
            let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
            let g:airline#extensions#tabline#show_tab_nr = 1
            let g:airline#extensions#tabline#formatter = 'default'
            let g:airline#extensions#tabline#buffer_nr_show = 0
            let g:airline#extensions#tabline#fnametruncate = 16
            let g:airline#extensions#tabline#fnamecollapse = 2
            let g:airline#extensions#tabline#buffer_idx_mode = 1

            function! BufferChange(num) abort
                let l:buf_count = bufnr('$')
                let l:buf_current = bufnr('%')
                let l:buf_first = buf_count - (buf_current - 1)
                let l:buf_cur = buf_first + a:num - 1
                echo "current"buf_current
                echo "count"buf_count
                echo "num"a:num
                if a:num == 1
                    execute 'br'
                elseif a:num < buf_current
                    let l:nextNum = buf_current - a:num  
                    execute l:nextNum'bNext'
                elseif a:num > buf_current
                    let l:nextNum = a:num - buf_current
                    execute l:nextNum'bnext'
                else 
                    echo "current is this buffer"
                endif 
            endfunction
    ]])
end

return M
