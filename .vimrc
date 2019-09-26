set nocompatible              " be iMproved, required
set nu
set relativenumber
set incsearch
set hlsearch
set foldmethod=indent

filetype off                  " required
set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

source ~/.vimrc_plugins

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab


let s:personnal_folder = $HOME . "/.vim/local/"
let s:vim_files = split(globpath(s:personnal_folder, "*.vim"), "\n")

for s:conf_file in s:vim_files
    execute "source  " . s:conf_file
endfor

au BufNewFile *.sh call ShellShebang()
function! ShellShebang()
    normal i#/bin/zsh
    write
endfunction

let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'


" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
"--------------------------------------------------------------------------------

set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line


" make backspaces more powerfull
set backspace=indent,eol,start

set ruler                           " show line and column number
syntax on               " syntax highlighting
set showcmd             " show (partial) command in status line

Plugin 'scrooloose/nerdtree'
let g:NERDTreeNodeDelimiter = "\u00a0"

" Open .vimrc
nnoremap <leader>rc :tabnew $MYVIMRC<cr>
map <F3> :source $MYVIMRC<cr>

" Naviguation
map <F2> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFocus<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
imap <C-j> <C-o><C-W>j
imap <C-k> <C-o><C-W>k
imap <C-h> <C-o><C-W>h
nnoremap <tab> gt
nnoremap <s-tab> gT
map <C-l> <C-o><C-W>l

" remove auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" let NERDTreeMapOpenInTab='<space>'
set autochdir
map <C-t> :tabnew None <CR>
set path+=**
set wildmenu

" needed so that vim still understands escape sequences
map <C-n> :noh<CR>

" Fast write
imap <C-w> <C-o>:w<CR>

" Copy paste to sytem clipboard
vmap <C-c> "*y
map <C-v> "*p

colorscheme seattle

" Personnal status bar
set laststatus=2
set statusline=%r\ %F\ %m\ %=%l,%-c\ --\ %p%%\ \ 

function! DirectoryHeaders()
    let l:directory = split(getline("."), " ")[1]
    let l:directory =  l:directory[2:]
    let l:buffer_commad = LoadHeaders(l:directory)
	echom l:buffer_commad
    return l:buffer_commad
endfunction

nnoremap <leader>l :execute DirectoryHeaders()<cr>
nnoremap <leader>q :call SwitchQuote()<cr>
