
" set viewport width
let g:goyo_width = 120

function! s:goyo_enter()
    set wrap
    set nofoldenable
    set nonumber
    set norelativenumber
    au InsertLeave * :set norelativenumber
endfunction

function! s:goyo_leave()
    set nowrap
    set foldenable
    set number
    set relativenumber
    au InsertLeave * :set relativenumber
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
