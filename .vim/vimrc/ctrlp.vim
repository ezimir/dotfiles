
" ignore pattern (never want to open these, no sense to list them)
let g:ctrlp_custom_ignore = {
    \   'file': '\.pyc$\|\.png$\|\.jpg$\|\.gif$',
    \}

" remap ctrlp to always open in a new tab
let g:ctrlp_prompt_mappings = {
    \   'AcceptSelection("e")': ['<c-t>'],
    \   'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \}

