
" change the mapleader from \ to ,
let mapleader="\<Space>"

" fast saving
nnoremap <leader>w :w!<CR>

" fast quitting
nnoremap <leader>q :q<CR>

" display name of syntax group for word under cursor
nnoremap <leader>sg :echom synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>

" deselect last search query
nnoremap <silent> <leader>/ :nohlsearch<CR>

" open tag under cursor in new tab via Ctrl+\
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" disable arrow keys
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>
vnoremap <up> <NOP>
vnoremap <down> <NOP>
vnoremap <left> <NOP>
vnoremap <right> <NOP>
nnoremap <up> <NOP>
nnoremap <down> <NOP>
nnoremap <left> <NOP>
nnoremap <right> <NOP>

" improve movement over wrapped lines
nnoremap j gj
nnoremap k gk

" improve movement over screen (scrolling)
nnoremap <c-j> <c-e>
nnoremap <c-k> <c-y>

" make Y consistend with C and D (from cursor to end of line)
nnoremap Y y$

" disable ex mode
nnoremap Q <NOP>

" disable looking up words in man
noremap <S-K> <NOP>

" keep search results in the middle of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" keep visual block selected after indenting it
vnoremap < <gv
vnoremap > >gv

" propagate . command to each line of visual block
vnoremap . :normal .<CR>

" tab navigation
nnoremap <silent> <S-Left> :tabprevious<CR>
nnoremap <silent> <S-Right> :tabnext<CR>

" tab movement
function! MoveTabLeft()
    let tabnr = tabpagenr() - 2
    if tabnr < 0
        let tabnr = tabpagenr('$')
    endif
    execute "tabmove " . tabnr
endfunction
function! MoveTabRight()
    let tabnr = tabpagenr() + 1
    if tabnr > tabpagenr('$')
        let tabnr = 0
    endif
    execute "tabmove " . tabnr
endfunction

nnoremap <silent> <S-A-Left> :call MoveTabLeft()<CR>
nnoremap <silent> <S-A-Right> :call MoveTabRight()<CR>

