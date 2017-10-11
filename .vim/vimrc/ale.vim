
" customize gutter sign
let g:ale_sign_error = 'E>'
let g:ale_sign_warning = 'W-'

" format error message
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" use quickfix window instead of location list
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1


augroup UpdateStatusLine
    autocmd!
    autocmd User ALELint call lightline#update()
augroup END

