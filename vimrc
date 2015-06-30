
" General
    " explicitly get out of vi-compatible mode (use vim-defaults instead of vi-defaults (easier, more user friendly))
    set nocompatible

    " don't use local version of .(g)vimrc, .exrc
    set noexrc

    " UTF-8
    set encoding=utf-8 " charset used by Vim to represent data in memory


" Environment
    " sets how many lines of history VIM has to remember
    set history=1000

    " use N levels of undo
    set undolevels=1000

    " remember undo after quitting
    set hidden


" File Handling
    " set to auto read when a file is changed from the outside
    set autoread

    " default file mode is unix
    set fileformat=unix

    " support all three, in this order
    set fileformats=unix,dos,mac

    " enable filetype plugins (auto completion and indentation support)
    filetype plugin on
    filetype indent on

" Interaction/Mapping
    " change the mapleader from \ to ,
    let mapleader=","

    " fast saving
    nmap <leader>w :w!<cr>

    " deselect last search query
    nnoremap <silent> <leader>/ :nohlsearch<CR>

    " disable ex mode
    nnoremap Q <Nop>

    " enable mouse (all modes)
    set mouse=a

" Interface
    " don't redraw while executing macros (good performance config)
    set lazyredraw

    " display cursor line
    set cursorline

    " lines above/below cursor when scrolling
    set scrolloff=5

    " line numbers
    set number " show line numbers (enable line column)
    set relativenumber " +- from current line

    " show cursor position in status bar
    set ruler

    " show matching bracket
    set showmatch

    " show mode in status bar (insert/replace/...)
    set showmode

    " whitespace
    set list " display everything
    set listchars=tab:▸\ , " specify whitespace representation characters

    " configure backspace so it acts as it should act
    set backspace=eol,start,indent " positions where to allow backspace

" Editing
    " dont wrap lines
    set nowrap

    " search
    set hlsearch " highlight search
    set incsearch " search incremently (search while typing)
    set ignorecase " case insensitive searching
    set smartcase " but become case sensitive if you type uppercase characters

    " indentation
    set expandtab " turn a tabs into spaces
    set tabstop=4 " number of spaces a tab counts for
    set softtabstop=4 " ???
    set autoindent " ???
    set shiftwidth=4 " spaces for autoindents
    set copyindent " copy the previous indentation on autoindenting
    set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
    set smartindent " ???
    set smarttab " ???

" Appearance
    " syntax highlighting on
    syntax on

    " simple dark scheme
    colorscheme desert

    " if possible, use nicer font
    if &t_Co >= 256 || has("gui_running")
        set guifont=Source_Code_Pro_Light:h12
    endif

    " assuming MacVim
    if has("gui")
        " tab navigation
        nmap <D-S-Left> :tabprevious<CR>
        nmap <D-S-Right> :tabnext<CR>

        " make window semitransparent
        set transparency=7
    endif

" Auto commands
    if has("autocmd")
        " highlight trailing whitespace
        highlight ExtraWhitespace ctermbg=darkred guibg=darkred " name a new highlight group
        match ExtraWhitespace /\s\+$/ " show the group

        " Remove trailing whitespace in files
        au BufWritePre * :%s/\s\+$//e
    endif " has("autocmd")

