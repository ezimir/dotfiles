
" syntax error checks
Plugin 'scrooloose/syntastic'

let g:syntastic_stl_format = '[%E{E#%e}%B{, }%W{W#%w}]'

let g:syntastic_always_populate_loc_list = 1 " add errors to location list
let g:syntastic_check_on_open = 1 " check when opening file
let g:syntastic_check_on_wq = 0 " don't check when quitting (not going to see it)
" disable automatic error detection
let b:syntastic_mode = 'passive'


" detect errors and update statusline
function! Syntastic()
    SyntasticCheck
    call lightline#update()
endfunction

if has('autocmd')
    augroup Syntastic
        au!
        au BufWritePost * call Syntastic()
    augroup END
endif

