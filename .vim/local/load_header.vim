" Use to load each header (.h) file in the given
" directory in the buffer list.
" Use to allow completion with headers elements easily
"
" Usage : execute LoadHeaders("/path/to/your/dir")

function! LoadHeaders(directory)
    let files=globpath(a:directory, "*.h")
    let command=""
    for file in split(files)
        if len(command) != 0
            let command = command . " | "
        endif
        let command = command . "badd " . file
    endfor
    return command
endfunction
