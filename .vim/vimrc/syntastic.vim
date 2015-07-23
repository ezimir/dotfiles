
" syntax error checks
Plugin 'scrooloose/syntastic'

" statusline string format: 'E#3 W#5'
let g:syntastic_stl_format = '[%E{E#%e}%B{, }%W{W#%w}]'

" add errors to location list
let g:syntastic_always_populate_loc_list = 1

" don't check when quitting (not going to see it)
let g:syntastic_check_on_wq = 0

" disable automatic error detection
let b:syntastic_mode = 'passive'

" in case mode is active, following is useful:
if !exists('b:syntastic_mode')
    " check when opening file
    let g:syntastic_check_on_open = 1
endif


" detect errors and update statusline
function! Syntastic()
    SyntasticCheck
    call lightline#update()
endfunction

" toggle location list (via detecting if number of opened windows changed)
function! ToggleLocationList()
    call Syntastic()

    let win_count = winnr('$') " save number of opened windows
    lclose " try to close location list
    if win_count == winnr('$') " if number of opened windows didn't change
        Errors " nothing was closed, we can open error list
    endif
endfunction

" set mapping for location list toggle
nnoremap <silent> <leader>e :call ToggleLocationList()<cr>

" autoupdate error list and statusline on file save
if has('autocmd')
    augroup Syntastic
        au!
        au BufWritePost *.{py,html} call Syntastic()
        au FileType python,html call Syntastic()
    augroup END
endif

