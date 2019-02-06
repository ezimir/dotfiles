
" load vim-plug if not present
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" init vim-plug
call plug#begin('~/.vim/bundle')


" interface
Plug 'sjl/badwolf'            " colorscheme
Plug 'itchyny/lightline.vim'  " nicer statusline

" integrations
Plug 'airblade/vim-gitgutter' " display git status in gutter
Plug 'w0rp/ale'               " syntax error checks

" editing
Plug 'godlygeek/tabular', { 'on': 'Tabularize' } " tabular alignment
Plug 'tpope/vim-commentary'   " comment/uncomment whole blocks
Plug 'junegunn/fzf'           " fuzzy file finder
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'      " autocompletion using <Tab>


call plug#end()

