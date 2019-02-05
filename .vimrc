
let s:vimfiles = [
    \'~/.vim/config/init.vim',
    \'~/.vim/config/plugins.vim',
    \'~/.vim/config/interface.vim',
    \'~/.vim/config/keys.vim',
\]

" load all configuration files
for filename in s:vimfiles
    if filereadable(expand(filename))
        exec 'source ' . expand(filename)
    endif
endfor

" load all plugin settings (omit files starting with _)
for filename in split(glob('~/.vim/settings/[^_]*.vim'), '\n')
    exec 'source ' . filename
endfor


