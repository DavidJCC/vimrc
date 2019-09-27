call plug#begin()
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/fzf.vim'

    " Themes
    Plug 'seesleestak/duo-mini'
    Plug 'wallysslima/agua'
    Plug 'CreaturePhil/vim-handmade-hero'
call plug#end()

colorscheme handmade-hero
"colorscheme gruvbox
let g:airline_theme='murmur'
set termguicolors

let mapleader=","
set number
set relativenumber

" easy split window nav
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <silent> ,, <C-w><C-w>
map <silent> ,. <C-w>h

" disable ex mode
map Q <Nop>

" copy/paste from system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
noremap <C-o> :NERDTreeToggle<CR>

let &encoding='utf-8'
let &fileencoding='utf-8'
let &termencoding='utf-8'
set autoindent
set backspace=indent,eol,start
set infercase

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

"map the F4 key to switch between header and source (C/C++)
map <F5> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" same as above except open the header/source in a vertical split window
map <C-F5> :vsp %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" same as above except open the header/source in a vertical split window
map <S-F5> :sp %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" map F9 to open vimrc
map <silent> <C-F9> :vsp $MYVIMRC<CR>
map <silent> <S-F9> :sp $MYVIMRC<CR>
map <silent> <F9> :e $MYVIMRC<CR>

" disable the arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

map <C-p> :Files<CR>

"Show when a line is getting tooooooooo long
highlight ColorColumn ctermbg=red ctermfg=blue guibg=#303030
call matchadd('ColorColumn', '\%101v', 100)

"automatic reloading of vimrc
augroup reloadConfigFile
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END


