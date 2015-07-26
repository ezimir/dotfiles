
" for statusline to always appear
set laststatus=2

" statusline configuration
let g:lightline = {
    \   'active': {
    \       'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
    \       'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype', 'syntastic' ] ],
    \   },
    \   'component_type': {
    \       'syntastic': 'error',
    \   },
    \   'component_expand': {
    \       'syntastic': 'SyntasticStatuslineFlag',
    \   },
    \   'component': {
    \       'readonly': '%{&readonly?"⭤":""}',
    \   },
    \}

