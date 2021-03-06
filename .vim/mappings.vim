"- - - - - "
" Mappings "
"- - - - - "

" Set leader key
let mapleader = ','

" Drag lines up or down
nnoremap - ddp
nnoremap _ ddkP

" Change begin and end line characters
nnoremap L $
vnoremap L $
onoremap L $
nnoremap H 0
vnoremap H 0
onoremap H 0
nnoremap $ L
vnoremap $ L
onoremap $ L
nnoremap 0 H
vnoremap 0 H
onoremap 0 H

" Clone the current line downwards and upwards
nnoremap <c-j> yyp
nnoremap <c-k> yyP

" Buffer navigation mappings
nnoremap <leader>h :bprevious<cr>
nnoremap <leader>l :bnext<cr>
nnoremap <leader>k :bfirst<cr>
nnoremap <leader>j :blast<cr>

" Open .vimrc NOW
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Run the macro saved in register s (space)
nnoremap <space> @s

" Escape key alternative
inoremap jk <esc>

" Map a split of netrw
nnoremap <F2> :Explore<cr>

" ¯\_(ツ)_/¯
iabbrev shrug ¯\_(ツ)_/¯

" Same file, multiple windows, locked scrolling
nnoremap <leader>& :set noscb<cr>:vsp<cr><c-w>l<c-f>:set scb<cr><c-w>h:set scb<cr>

" Toggle 76-char column line
function! ColorColumnToggle()
    if &colorcolumn
        setlocal colorcolumn=0
    else
        setlocal colorcolumn=80
    endif
endfunction

" Toggle fold column
function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction

" Toggle cursor line and column
function! CursorWhereToggle()
    if &cursorline
        setlocal nocursorline
        setlocal nocursorcolumn
    else
        setlocal cursorline
        setlocal cursorcolumn
    endif
endfunction

" Toggle showing hidden characters
function! HiddenCharToggle()
    if &list
        setlocal nolist
    else
        setlocal list
    endif
endfunction

" Toggle wrapping
function! WrapToggle()
    if &wrap
        setlocal nowrap
    else
        setlocal wrap
    endif
endfunction

" Toggle all functions at once
function! ToggleAll()
    call HiddenCharToggle()
    call CursorWhereToggle()
    call ColorColumnToggle()
    call FoldColumnToggle()
endfunction

nnoremap <leader>mz :call HiddenCharToggle()<cr>
nnoremap <leader>mx :call CursorWhereToggle()<cr>
nnoremap <leader>mc :call ColorColumnToggle()<cr>
nnoremap <leader>mf :call FoldColumnToggle()<cr>
nnoremap <leader>mw :call WrapToggle()<cr>

nnoremap <leader>ma :call ToggleAll()<cr>

" Toogle search highlighting
nnoremap <silent><expr> <leader>mh (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" Visual mode search and replace
vnoremap s ""y:%s/<C-r>"/

" Start scratchpad
"command! Scratch :15sp ~/.vim/tmp/scratchpad

function! ScratchBuffer()
    noswapfile hide enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    file scratch
endfunction

nnoremap <F4> :call ScratchBuffer()<cr>

" Toggle paste mode
set pastetoggle=<F3>

" Call make on the current folder
nnoremap <buffer> <F5> :make!<cr>
