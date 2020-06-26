
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


" enable fixers
let g:ale_fixers = {
        \'python': ['black'],
        \'javascript': ['eslint'],
        \'json': ['prettier'],
        \'php': ['phpcbf'],
    \}

let g:ale_python_black_options = '--config ' . expand('~/.config/black')
let g:ale_javascript_eslint_options = '--config ' . expand('~/.config/eslint.json') . ' --resolve-plugins-relative-to ' . expand('~/.config/yarn/global/')
let g:ale_javascript_prettier_options = '--config ' . expand('~/.config/prettier.toml')
let g:ale_php_phpcs_options = '--standard=' . expand('~/.config/phpcs.xml')
let g:ale_php_phpcbf_standard = expand('~/.config/phpcs.xml')

" run fixers on save
let g:ale_fix_on_save = 1

