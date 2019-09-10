" SwitchQuote : 
"
" Used to switch quote or dquote symbols in the current line
" dquote will become quote, and vice-versa

function! SwitchQuote()
    let l:line = getline('.')

    let l:duplicate_str = ""
    " Parse each char of the current position, switching expected char
    for l:letter in split(l:line, '\zs')
        if letter ==# '"'
            let l:letter = "'"
        elseif letter ==# "'"
            let l:letter = '"'
        endif
        let l:duplicate_str = l:duplicate_str . letter
    endfor

    call setline('.', l:duplicate_str)
endfunction
