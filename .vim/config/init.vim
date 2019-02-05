
" explicitly get out of vi-compatible mode (use vim-defaults instead of vi-defaults (easier, more user friendly))
set nocompatible

" don't use local version of .(g)vimrc, .exrc
set noexrc

" UTF-8
set encoding=utf-8 " charset used by Vim to represent data in memory

" hide buffers instead of asking if to save them
set hidden

" history
set history=1000             " sets how many lines of history VIM has to remember
set undolevels=1000          " use N levels of undo
set undofile                 " maintain undo history between sessions
set undodir=~/.vim/undodir   " keep undo files in dedicated dir (don't pollute local dirs)

" file handling
set fileformat=unix          " default file mode is unix
set fileformats=unix,dos,mac " support all three, in this order
set writebackup              " create a backup file when writing
set nobackup                 " but don't keep it after write is done
set noswapfile               " don't write swapfile

