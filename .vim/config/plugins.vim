
" load vim-plug if not present
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" init vim-plug
call plug#begin('~/.vim/bundle')

call plug#end()

