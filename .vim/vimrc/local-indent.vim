
highlight LocalIndentGuide guifg=NONE guibg=#445555 ctermfg=8 ctermbg=0 cterm=inverse

" enable highlighting for python files
if has('autocmd')
    augroup LocalIndentGuide
        au!
        au FileType python LocalIndentGuide +hl
    augroup END
endif

