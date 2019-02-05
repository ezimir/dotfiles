
" keep gutter always open
let g:ale_sign_column_always = 1

" customize gutter sign
let g:ale_sign_error = 'E>'
let g:ale_sign_warning = 'W-'

" format error message
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" " use quickfix window instead of location list
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1


" disable linting for diff files
augroup VimDiff
    autocmd!
    autocmd VimEnter,FilterWritePre * if &diff | ALEDisable | endif
augroup END

