
" enable filetype plugins (auto completion and indentation support)
filetype plugin on
filetype indent on

" set to auto read when a file is changed from the outside
set autoread

" search
set hlsearch       " highlight search
set incsearch      " search incremently (search while typing)
set ignorecase     " case insensitive searching
set smartcase      " but become case sensitive if you type uppercase characters
set gdefault       " applies substitutions globally on lines as default (:%s/foo/bar/g)

" indentation
set expandtab      " turn a tabs into spaces
set tabstop=4      " number of spaces a tab counts for
set softtabstop=4  " number of spaces <Tab> counts for in insert mode
set shiftwidth=4   " spaces for autoindents
set shiftround     " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent     " insert indent when starting newline using o/O
set copyindent     " copy the previous indentation on autoindenting
set smartindent    " do smart indenting when starting a new line
set smarttab       " use <shiftwidth> when using <Tab> in front of a line

" interface components
set showmatch      " show matching bracket
set showcmd        " show size of visual selection
" set noshowmode     " don't show mode in status bar (insert/replace/...) (statusline plugin displays it)
set wildmenu       " show possible completions for commands
set number         " show line numbers (enable line column)
set relativenumber " +- from current line
set cursorline     " display cursor line
set ruler          " show cursor position in status bar
set scrolloff=5    " lines above/below cursor when scrolling
set lazyredraw     " don't redraw while executing macros (good performance config)

" dont wrap lines
set nowrap

" whitespace
set list " display everything
set listchars=tab:‣\ ,extends:›,precedes:‹,nbsp:␣

" configure backspace so it acts as it should act
set backspace=eol,start,indent " positions where to allow backspace

" enable mouse (all modes)
if has('mouse')
    set mouse=a
endif



" syntax highlighting on
syntax on

" simple dark scheme
silent! colorscheme badwolf

" revert CSS colors set by badwolf to 'cssProp'
for group in ['cssColorProp', 'cssBoxProp', 'cssTextProp', 'cssRenderProp', 'cssGeneratedContentProp']
    execute 'hi clear ' . group
    execute 'hi link ' . group . ' cssProp'
endfor

" if possible, use nicer font
if &t_Co >= 256 || has('gui_running')
    set guifont=Source_Code_Pro_ExtraLight:h11
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

" cursor line needs more contrast
highlight CursorLine guibg=#35322d

