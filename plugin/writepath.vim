" writepath.vim - Creates full path leading to a file on write.
"
" With this plugin you can open a file for writing and always save it on the
" filesystem without having to create the parent directories leading up to it.
"
" Author: Artem Nezvigin <artem@artnez.com>

function! CreateParentPath(filepath)
    if filereadable(a:filepath)
        return
    endif
    let dirname = fnamemodify(expand(a:filepath), ':h')
    if isdirectory(expand(dirname))
        return
    endif
    call mkdir(dirname, 'p')
endfunction

autocmd BufWritePre * call CreateParentPath(expand('%:p'))
