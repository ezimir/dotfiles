
if has('autocmd')
    augroup EnableRainbow
        au!
        au FileType python,javascript RainbowParentheses
    augroup END
endif

let g:rainbow#blacklist = [121]
