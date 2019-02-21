
" load all configuration files (omit files starting with _)
for filename in split(glob('~/.vim/config/[^_]*.vim'), '\n')
    exec 'source ' . expand(filename)
endfor

" load all plugin settings (omit files starting with _)
for filename in split(glob('~/.vim/settings/[^_]*.vim'), '\n')
    exec 'source ' . filename
endfor


