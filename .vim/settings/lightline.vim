
" for statusline to always appear
set laststatus=2

let g:lightline = {
    \'active': {
        \'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
        \'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype'], [ 'lint' ] ],
    \},
    \'component_type': {
        \'lint': 'error',
    \},
    \'component_expand': {
        \'lint': 'ALEGetStatusLineFlag',
    \},
    \'component': {
        \'readonly': '%{&readonly?"⭤":""}',
    \},
\}


" statusline configuration
    "\       'left': [ [ 'mode', 'paste' ], [ 'ctrlpmark', 'tagbar' ], [ 'readonly', 'filename', 'modified' ] ],
    "\       'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'tagstatus', 'fileformat', 'fileencoding', 'filetype', 'lint' ] ],
    "\   'component_function': {
    "\       'ctrlpmark': 'CtrlPMark',
    "\       'tagstatus': 'GutentagsFlag',
    "\   },
    "\   'component': {
    "\       'tagbar': '%{tagbar#currenttag("[%s]", "", "f")}',
    "\   },


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

autocmd User ALELintPost call lightline#update()


" function! GutentagsFlag() abort
"     return gutentags#statusline("")
" endfunction

