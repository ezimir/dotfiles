
" load vim-plug if not present
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" init vim-plug
call plug#begin('~/.vim/bundle')


" interface
Plug 'sjl/badwolf'              " colorscheme (dark)
Plug 'JaySandhu/xcode-vim'      " colorscheme (light)
Plug 'itchyny/lightline.vim'    " nicer statusline
Plug 'ludovicchabant/vim-gutentags' " autogenerate tags

" integrations
Plug 'airblade/vim-gitgutter'   " display git status in gutter
Plug 'w0rp/ale'                 " syntax error checks
Plug 'SirVer/ultisnips'         " code snippet autoexpansion
Plug 'majutsushi/tagbar'        " file hierarchy overviewin sidebar

" editing
Plug 'godlygeek/tabular', { 'on': 'Tabularize' } " tabular alignment
Plug 'tpope/vim-commentary'     " comment/uncomment whole blocks
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy file finder
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'        " autocompletion using <Tab>
Plug 'vim-scripts/closetag.vim' " autoclose HTML tags
Plug 'mattn/emmet-vim'          " HTML tag expanding from CSS syntax
Plug 'posva/vim-vue'            " improved syntax for .vue files

" extensions
Plug 'aserebryakov/vim-todo-lists' " todo checklist file format
Plug 'junegunn/goyo.vim'        " focused writing

call plug#end()

