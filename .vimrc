
" General
    " explicitly get out of vi-compatible mode (use vim-defaults instead of vi-defaults (easier, more user friendly))
    set nocompatible

    " don't use local version of .(g)vimrc, .exrc
    set noexrc

    " UTF-8
    set encoding=utf-8 " charset used by Vim to represent data in memory


" Plugin Manager
    " required for Vundle
    filetype off

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

    " easy file opening
    Plugin 'kien/ctrlp.vim'

    " nicer statusline
    Plugin 'itchyny/lightline.vim'

    " display nested parentheses with different colors
    Plugin 'junegunn/rainbow_parentheses.vim'

    " CSS like syntax for creating HTML
    Plugin 'rstacruz/sparkup'

    " autocompletion using <Tab>
    Plugin 'ervandew/supertab'

    " syntax error checks
    Plugin 'scrooloose/syntastic'

    " list of variables/functions in current buffer
    Plugin 'majutsushi/tagbar'

    " code snippet autoexpansion
    Plugin 'SirVer/ultisnips'

    " comment/uncomment whole blocks
    Plugin 'tpope/vim-commentary'

    " displays vertical lines where indents are
    Plugin 'nathanaelkane/vim-indent-guides'

    " repeat plugin actions with '.'
    Plugin 'tpope/vim-repeat'

    " surrounding movements/actions
    Plugin 'tpope/vim-surround'

    call vundle#end()


" Environment
    " sets how many lines of history VIM has to remember
    set history=1000

    " use N levels of undo
    set undolevels=1000

    " hide buffers instead of asking if to save them
    set hidden


" File Handling
    " enable filetype plugins (auto completion and indentation support)
    filetype plugin on
    filetype indent on

    " set to auto read when a file is changed from the outside
    set autoread

    " default file mode is unix
    set fileformat=unix

    " support all three, in this order
    set fileformats=unix,dos,mac

    " create a backup file when writing
    set writebackup

    " but don't keep it after write is done
    set nobackup

    " don't write swapfile
    set noswapfile


" Interaction/Mapping
    " change the mapleader from \ to ,
    let mapleader="\<Space>"

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

    " open .vimrc in new tab (for quick edits)
    nnoremap <leader>.e :tabe $MYVIMRC<CR>

    " reload .vimrc
    nnoremap <silent> <leader>.r :source $MYVIMRC<CR>:call lightline#update()<CR>

    " fast saving
    nnoremap <leader>w :w!<CR>

    " fast quitting
    nnoremap <leader>q :q<CR>

    " deselect last search query
    nnoremap <silent> <leader>/ :nohlsearch<CR>

    " disable ex mode
    nnoremap Q <NOP>

    " disable looking up words in man
    noremap <S-K> <NOP>

    " enable mouse (all modes)
    set mouse=a

    " error list navigation
    nnoremap <silent> ]e :lnext<CR>
    nnoremap <silent> [e :lprev<CR>

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

    " tab navigation
    nnoremap <silent> <S-Left> :tabprevious<CR>
    nnoremap <silent> <S-Right> :tabnext<CR>

    " tab movement
    function! MoveTabLeft()
        let tabnr = tabpagenr()
        execute "tabmove " . (tabnr - 2)
        if tabnr == tabpagenr()
            tabmove
        endif
    endfunction
    function! MoveTabRight()
        let tabnr = tabpagenr()
        execute "tabmove " . (tabnr + 1)
        if tabnr == tabpagenr()
            tabmove 0
        endif
    endfunction

    nnoremap <silent> <S-A-Left> :call MoveTabLeft()<CR>
    nnoremap <silent> <S-A-Right> :call MoveTabRight()<CR>


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

    " don't show mode in status bar (insert/replace/...) (statusline plugin displays it)
    set noshowmode

    " show size of visual selection
    set showcmd

    " whitespace
    set list " display everything
    set listchars=tab:‣\ , " specify whitespace representation characters

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
    set gdefault " applies substitutions globally on lines as default (:%s/foo/bar/g)

    " indentation
    set expandtab " turn a tabs into spaces
    set tabstop=4 " number of spaces a tab counts for
    set softtabstop=4 " number of spaces <Tab> counts for in insert mode
    set shiftwidth=4 " spaces for autoindents
    set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
    set autoindent " insert indent when starting newline using o/O
    set copyindent " copy the previous indentation on autoindenting
    set smartindent " do smart indenting when starting a new line
    set smarttab " use <shiftwidth> when using <Tab> in front of a line


" Appearance
    " syntax highlighting on
    syntax on

    " simple dark scheme
    colorscheme badwolf

    " revert CSS colors set by badwolf to 'cssProp'
    for group in ['cssColorProp', 'cssBoxProp', 'cssTextProp', 'cssRenderProp', 'cssGeneratedContentProp']
        execute 'hi clear ' . group
        execute 'hi link ' . group . ' cssProp'
    endfor

    " if possible, use nicer font
    if &t_Co >= 256 || has('gui_running')
        set guifont=Source_Code_Pro_Light:h12
    endif

    " assuming MacVim
    if has('gui_running')
        " make window semitransparent
        set transparency=7

        " don't display scrollbar on left (happens with splits)
        set guioptions-=L
    endif

    " highlight trailing whitespace
    highlight ExtraWhitespace ctermbg=darkred guibg=darkred " name a new highlight group
    match ExtraWhitespace /\s\+$/ " show the group

    " cursor line needs more contrast
    highlight CursorLine guibg=#35322d

    " display name of syntax group for word under cursor
    nnoremap <leader>sg :echom synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>

" Auto commands
    if has('autocmd')
        " remove trailing whitespace on save (if allowed by filetype)
        augroup Trailing
            au!

            " simple blacklist of filetypes where whitespace is crucial
            let g:trailing_filetype_blacklist=['diff']

            " whitespace stripping with cursor restoration
            function! StripTrailing()
                if index(g:trailing_filetype_blacklist, &filetype) > -1
                    return
                endif

                " save last search, and cursor position.
                let _s=@/
                let l = line(".")
                let c = col(".")
                " execute replace
                %s/\s\+$//e
                " restore previous search history, and cursor position
                let @/=_s
                call cursor(l, c)
            endfunction

            " remove trailing whitespace before writing file
            au BufWritePre * :call StripTrailing()
        augroup END

        " toggle line number display when changing modes
        augroup LineNumbers
            au!
            au InsertEnter * :set norelativenumber
            au InsertLeave * :set relativenumber
        augroup END

        " when editing commit messages, wrap lines automatically
        augroup CommitEditor
            au!
            au FileType hgcommit,gitcommit set textwidth=72
        augroup END

        " autocomplete hyphenated words in CSS
        augroup CSSKeywords
            au!
            au FileType css set iskeyword+=-
        augroup END
    endif " has('autocmd')


" Plugin configuration
    for filename in split(glob('~/.vim/vimrc/*.vim'), '\n')
        exe 'source' filename
    endfor

