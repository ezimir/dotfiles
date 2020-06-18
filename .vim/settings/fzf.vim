
" open FZF with custom mapping
nnoremap <leader>f :Files<CR>

" change split key binding to ctrl-s
let g:fzf_action = {
    \'ctrl-t': 'tab split',
    \'ctrl-s': 'split',
    \'ctrl-v': 'vsplit'
\}

" always enable preview window
let g:fzf_preview_window = 'right:60%'

