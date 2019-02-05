
" load vim-plug if not present
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" init vim-plug
call plug#begin('~/.vim/bundle')


" colorscheme
Plug 'sjl/badwolf'

" tabular alignment
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

" comment/uncomment whole blocks
Plug 'tpope/vim-commentary'


" nicer statusline
Plug 'itchyny/lightline.vim'

" syntax error checks
Plug 'w0rp/ale'

" fuzzy file finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'


call plug#end()

