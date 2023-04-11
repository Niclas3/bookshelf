augroup filetypedetect
    au BufNewFile,BufRead *.xyz			setf xyz
    au BufNewFile,BufRead *.bin                 setf bin
    au BufNewFile,BufRead *.img                 setf bin
    " au BufNewFile,BufRead /usr/share/scripts/*	setf ruby
augroup END
