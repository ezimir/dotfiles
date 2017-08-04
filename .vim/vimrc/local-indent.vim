
highlight LocalIndentGuide guifg=#445555 guibg=NONE gui=inverse ctermfg=8 ctermbg=0 cterm=inverse

" enable highlighting for python files
if has('autocmd')
    augroup LocalIndentGuide
        au!
        au FileType python,html,htmldjango LocalIndentGuide +cc
    augroup END
endif

