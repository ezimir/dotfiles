
augroup ChangeShortcut
    au!

    " set ignore HTML unary tags always
    au Filetype html,htmldjango let b:unaryTagsStack="area base br dd dt hr img input link meta param"
    au Filetype html,htmldjango let b:closetag_html_style=1

    " autoclose when typing closing tag, not via <c+_>
    au Filetype html,htmldjango,xml,xsl inoremap <silent> </ <C-R>=GetCloseTag()<CR>
augroup END

