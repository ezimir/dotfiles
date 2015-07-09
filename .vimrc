
" Plugin Manager
    " required for Vundle
    set nocompatible
    filetype off

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

    " displays vertical lines where indents are
    Plugin 'nathanaelkane/vim-indent-guides'

    " syntax error checks
    Plugin 'scrooloose/syntastic'

    " autocompletion using <Tab>
    Plugin 'ervandew/supertab'

    " comment/uncomment whole blocks
    Plugin 'tpope/vim-commentary'

    " easy file opening
    Plugin 'kien/ctrlp.vim'

    " nicer statusline
    Plugin 'itchyny/lightline.vim'

    " code snippet autoexpansion
    Plugin 'mattn/emmet-vim'
    Plugin 'mattn/webapi-vim'

    call vundle#end()

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

    " error list navigation
    nmap <silent> ]e :lnext<CR>
    nmap <silent> [e :lprev<CR>

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
    set background=dark
    colorscheme desert

    " if possible, use nicer font
    if &t_Co >= 256 || has('gui_running')
        set guifont=Source_Code_Pro_Light:h12
    endif

    " assuming MacVim
    if has('gui')
        " make window semitransparent
        set transparency=7

        " tab navigation
        noremap <silent> <D-S-Left> :tabprevious<CR>
        noremap <silent> <D-S-Right> :tabnext<CR>

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

        noremap <silent> <D-S-A-Left> :call MoveTabLeft()<CR>
        noremap <silent> <D-S-A-Right> :call MoveTabRight()<CR>
    endif

    " autocompletion colors (popup menu)
    highlight Pmenu ctermbg=0 ctermfg=7 guibg=#222222 guifg=#e5e5e5
    highlight PmenuSel ctermbg=7 ctermfg=0 guibg=#e5e5e5 guifg=#222222
    highlight PmenuSbar ctermbg=238 guibg=#444444
    highlight PmenuThumb ctermbg=249 guibg=#aaaaaa

" Auto commands
    if has('autocmd')
        " highlight trailing whitespace
        highlight ExtraWhitespace ctermbg=darkred guibg=darkred " name a new highlight group
        match ExtraWhitespace /\s\+$/ " show the group

        " Remove trailing whitespace in files
        au BufWritePre * :%s/\s\+$//e
    endif " has('autocmd')

" Plugin configuration
    " indent highlighting
    let g:indent_guides_enable_on_vim_startup = 1 " auto enable
    let g:indent_guides_start_level = 2 " don't highlight column 0
    let g:indent_guides_guide_size = 1 " highlight 1 column wide

    " syntax errors
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_stl_format = '[%E{E#%e}%B{, }%W{W#%w}]'

    let g:syntastic_always_populate_loc_list = 1 " add errors to location list
    let g:syntastic_check_on_open = 1 " check when opening file
    let g:syntastic_check_on_wq = 0 " don't check when quitting (not going to see it)

    " custom function for toggling :Errors location list
    function! ToggleErrors()
        let win_count = winnr('$') " save number of opened windows
        lclose " try to close location list
        if win_count == winnr('$') " if number of opened windows didn't change
            Errors " nothing was closed, we can open error list
        endif
    endfunction

    noremap <silent> <leader>e :call ToggleErrors()<cr>

    " remap ctrlp to always open in a new tab
    let g:ctrlp_prompt_mappings = {
        \   'AcceptSelection("e")': ['<c-t>'],
        \   'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
        \}

    " disable status function in ctrlp
    let g:ctrlp_status_func = {
        \   'main': 'CtrlPStatusFuncMain',
        \   'prog': 'CtrlPStatusFuncProg',
        \}

    function! CtrlPStatusFuncMain(focus, byfname, regex, prev, item, next, marked)
        return lightline#statusline(0)
    endfunction

    function! CtrlPStatusFuncProg(str)
        return lightline#statusline(0)
    endfunction

    " for statusline to always appear
    set laststatus=2

    " statusline configuration
    let g:lightline = {
        \   'active': {
        \       'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
        \       'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ], [ 'syntastic' ] ],
        \   },
        \   'component_expand': {
        \       'syntastic': 'SyntasticStatuslineFlag',
        \   },
        \   'component_type': {
        \       'syntastic': 'error',
        \   },
        \   'component': {
        \       'readonly': '%{&readonly?"⭤":""}',
        \   },
        \}

    " set emmet expansion shortcut
    let g:user_emmet_leader_key = '<C-E>'

    " use single key to invoke emmet expansion
    imap <C-Z> <C-E>,

    " load custom emmet settings
    let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.vim/snippets.json')), "\n"))

