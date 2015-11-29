set nocompatible
execute pathogen#infect()

filetype plugin on
syntax enable
filetype plugin indent on

" set the leader character
let mapleader="/"

"airline settings
let g:airline_theme='murmur'
let g:airline_powerline_fonts=1

"ensure airline is visible
set laststatus=2

" stops auto commenting on a new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" fix trailing whitespace before save
autocmd BufWritePre * :FixWhitespace

" colour schemes
colors base16-default
colorscheme base16-default

let &encoding='utf-8'
let &fileencoding='utf-8'
let &termencoding='utf-8'
set autoindent
set backspace=indent,eol,start
set infercase

"enable 256 ansi colours in ConEmu
if !has("gui_running")
    set term=xterm
    set mouse=a
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    let &t_ti="\e[1 q"
    let &t_SI="\e[5 q"
    let &t_EI="\e[1 q"
    let &t_te="\e[0 q"
else
    set guioptions=
    if has('gui_win32')
        set guifont=Consolas:h9:cANSI
    endif
endif

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set nocursorline
set noshowmode
set smarttab
set number
set wildmenu
set noerrorbells
set novisualbell

" split line command
nnoremap K i<CR><Esc>

"map mouse wheel scrolling
inoremap <Esc>[62~ <C-X><C-E><C-E><C-E>
inoremap <Esc>[63~ <C-X><C-Y><C-Y><C-Y>
nnoremap <Esc>[62~ <C-E><C-E><C-E>
nnoremap <Esc>[63~ <C-Y><C-Y><C-Y>

"map toggle NERDTree command
noremap <silent> <F4> :NERDTreeToggle<CR>

"map the F4 key to switch between header and source (C/C++)
map <F5> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" same as above except open the header/source in a vertical split window
map <A-F5> :vsp %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" same but with horizontal split window
map <S-F5> :split %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" map F9 to open vimrc
noremap <silent> <F9> :vsp $MYVIMRC<CR>

" map the change working directory
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"disable the arrow keys (trying to break the habit)
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"Show when a line is getting tooooooooo long
highlight ColorColumn ctermbg=red ctermfg=blue guibg=#303030
call matchadd('ColorColumn', '\%101v', 100)

" check file change every 4 seconds ('CursorHold') and reload the buffer upon
" detecting change
set autoread
au CursorHold * checktime

set timeout " Do time out on mappings and others
set timeoutlen=3000 " Wait {num} ms before timing out a mapping

"automatic reloading of vimrc
augroup reloadConfigFile
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" map window change (easier than using C-w C-w
noremap <silent> ,, <C-w><C-w>
noremap <silent> ,. <C-w>h

" disable ex mode because its a pain in the arse
map Q <Nop>

" Search and replace word under cursor
nnoremap ,s :%s/\<<C-r><C-w>\>//g<Left><Left>

" map ; to : to save pressing shift because I'm lazy
nnoremap ; :

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" window swap shiz
function! MarkWindowSwap()
    " marked window number
    let g:markedWinNum = winnr()
    let g:markedBufNum = bufnr("%")
endfunction

function! DoWindowSwap()
    let curWinNum = winnr()
    let curBufNum = bufnr("%")
    " Switch focus to marked window
    exe g:markedWinNum . "wincmd w"

    " Load current buffer on marked window
    exe 'hide buf' curBufNum

    " Switch focus to current window
    exe curWinNum . "wincmd w"

    " Load marked buffer on current window
    exe 'hide buf' g:markedBufNum
endfunction

nnoremap H :call MarkWindowSwap()<CR> <C-w>h :call DoWindowSwap()<CR>
nnoremap J :call MarkWindowSwap()<CR> <C-w>j :call DoWindowSwap()<CR>
nnoremap K :call MarkWindowSwap()<CR> <C-w>k :call DoWindowSwap()<CR>
nnoremap L :call MarkWindowSwap()<CR> <C-w>l :call DoWindowSwap()<CR>
