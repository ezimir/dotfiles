
" use silver searcher to populate results
let g:ctrlp_user_command = 'ag %s -U -p ~/.ignore --nocolor -l -g ""'

" ignore pattern (never want to open these, no sense to list them)
let g:ctrlp_custom_ignore = {
    \   'dir':  '\v[\/]\.(git|hg|svn)$',
    \   'file': '\.pyc$\|\.png$\|\.jpg$\|\.gif$',
    \}

" disable per-session caching
let g:ctrlp_use_caching = 0

