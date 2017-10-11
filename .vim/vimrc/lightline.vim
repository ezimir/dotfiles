
" for statusline to always appear
set laststatus=2

" statusline configuration
let g:lightline = {
    \   'active': {
    \       'left': [ [ 'mode', 'paste' ], [ 'ctrlpmark', 'tagbar' ], [ 'readonly', 'filename', 'modified' ] ],
    \       'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype', 'lint' ] ],
    \   },
    \   'component_type': {
    \       'lint': 'error',
    \   },
    \   'component_function': {
    \       'ctrlpmark': 'CtrlPMark',
    \   },
    \   'component_expand': {
    \       'lint': 'ALEGetStatusLineFlag',
    \   },
    \   'component': {
    \       'readonly': '%{&readonly?"⭤":""}',
    \       'tagbar': '%{tagbar#currenttag("[%s]", "", "f")}',
    \   },
    \}

function! ALEGetStatusLineFlag() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    " statusline string format: 'E#3 W#5'
    return l:counts.total == 0 ? '' : printf(
    \   '[E#%d, W#%d]',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

function! CtrlPMark()
    if expand('%:t') =~ 'ControlP'
        call lightline#link('iR'[ g:lightline.ctrlp_regex ])
        return lightline#concatenate([ g:lightline.ctrlp_prev, g:lightline.ctrlp_item, g:lightline.ctrlp_next ], 0)
    else
        return ''
    endif
endfunction

let g:ctrlp_status_func = {
    \ 'main': 'CtrlPStatusFunc_1',
    \ 'prog': 'CtrlPStatusFunc_2',
    \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
    let g:lightline.ctrlp_regex = a:regex
    let g:lightline.ctrlp_prev = a:prev
    let g:lightline.ctrlp_item = a:item
    let g:lightline.ctrlp_next = a:next
    return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
    return lightline#statusline(0)
endfunction

