
" load vim-plug if not present
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" init vim-plug
call plug#begin('~/.vim/bundle')


" interface
Plug 'sjl/badwolf'            " colorscheme
Plug 'itchyny/lightline.vim'  " nicer statusline
Plug 'ludovicchabant/vim-gutentags' " autogenerate tags

" integrations
Plug 'airblade/vim-gitgutter' " display git status in gutter
Plug 'w0rp/ale'               " syntax error checks
Plug 'SirVer/ultisnips'       " code snippet autoexpansion

" editing
Plug 'godlygeek/tabular', { 'on': 'Tabularize' } " tabular alignment
Plug 'tpope/vim-commentary'   " comment/uncomment whole blocks
Plug 'junegunn/fzf'           " fuzzy file finder
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'      " autocompletion using <Tab>


" " display nested parentheses with different colors
" Plugin 'junegunn/rainbow_parentheses.vim'

" " CSS like syntax for creating HTML
" Plugin 'rstacruz/sparkup'


" " list of variables/functions in current buffer
" Plugin 'majutsushi/tagbar'

" " displays vertical lines where indents are
" Plugin 'nathanaelkane/vim-indent-guides'

" " repeat plugin actions with '.'
" Plugin 'tpope/vim-repeat'

" " surrounding movements/actions
" Plugin 'tpope/vim-surround'

" " display a guide at current indent level
" Plugin 'tweekmonster/local-indent.vim'

" " autoclose tags
" Plugin 'closetag.vim'

" " bracket navigation
" Plugin 'tpope/vim-unimpaired'

" " HTML5 tags in syntax
" Plugin 'othree/html5.vim'

" " SASS/SCSS syntax
" Plugin 'cakebaker/scss-syntax.vim'

" " concentrated writing
" Plugin 'junegunn/goyo.vim'

" " dim inactive buffers
" Plugin 'blueyed/vim-diminactive'

call plug#end()

