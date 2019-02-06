
if has('autocmd')

    " remove trailing whitespace on save (if allowed by filetype)
    augroup TrailingRemove
        au!
        " simple blacklist of filetypes where whitespace is crucial
        let g:trailing_filetype_blacklist=['diff']
        " whitespace stripping with cursor restoration
        function! StripTrailing()
            if index(g:trailing_filetype_blacklist, &filetype) > -1
                return
            endif
            " save last search, and cursor position.
            let _s=@/
            let l = line(".")
            let c = col(".")
            " execute replace
            %s/\s\+$//e
            " restore previous search history, and cursor position
            let @/=_s
            call cursor(l, c)
        endfunction
        " remove trailing whitespace before writing file
        au BufWritePre * :call StripTrailing()
    augroup END

    " only highlight trailing chars when not in insert mode
    augroup TrailingHighlight
        au!
        au InsertEnter * match ExtraWhitespace //
        au InsertLeave * match ExtraWhitespace /\s\+$/
    augroup END

    " toggle line number display when changing modes
    augroup LineNumbers
        au!
        au InsertEnter * :set norelativenumber
        au InsertLeave * :set relativenumber
    augroup END

    " when editing commit messages, wrap lines automatically
    augroup CommitEditor
        au!
        au FileType hgcommit,gitcommit set textwidth=72
    augroup END

    " autocomplete hyphenated words in CSS
    augroup CSSKeywords
        au!
        au FileType css set iskeyword+=-
    augroup END

    " wrap lines in vimdiff
    augroup WrapDiffs
        au!
        au FilterWritePre * if &diff | setlocal wrap | endif
    augroup END

    " autosave current date when editing .po files
    augroup PODate
        function! UpdateRevisionDate()
            let save_cursor = getpos('.')
            keepjumps %s/^"PO-Revision.*"/\=strftime('"PO-Revision-Date: %Y-%m-%d %H:%M%z\n"')/
            call histdel('search', -1)
            call setpos('.', save_cursor)
        endfunction
        au! BufWritePre *.po call UpdateRevisionDate()
    augroup END

endif

