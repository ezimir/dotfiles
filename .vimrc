
let s:vimfiles = [
    \'~/.vim/config/init.vim',
    \'~/.vim/config/interface.vim',
    \'~/.vim/config/keys.vim',
\]

" load all configuration files
for filename in s:vimfiles
    if filereadable(expand(filename))
        exec 'source ' . expand(filename)
    endif
endfor


