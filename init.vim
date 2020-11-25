call plug#begin()
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

    "Themes
    Plug 'morhetz/gruvbox'
    Plug 'andreasvc/vim-256noir'
    Plug 'CreaturePhil/vim-handmade-hero'
    Plug 'AlessandroYorba/Alduin'
call plug#end()

colorscheme alduin

let g:airline_theme='murmur'

let mapleader=","
set number
set relativenumber

noremap <C-p> :FZF<CR>

noremap <C-f> :Grepper<CR>

let g:fzf_layout = { 'window': { 'width': 0.3, 'height': 0.5, 'highlight': 'Comment', 'border': 'sharp' } }

" Example of how to customise the fzf window colours
"hi! fzf_fg ctermfg=14
"hi! fzf_fgp ctermfg=3
"hi! fzf_hl ctermfg=5
"hi! fzf_hlp ctermfg=5
"hi! fzf_info ctermfg=6
"hi! fzf_prompt ctermfg=6
"hi! fzf_spinner ctermfg=6
"hi! fzf_pointer ctermfg=3
"let g:fzf_colors = {
"  \'fg': ['fg', 'fzf_fg'],
"  \'hl': ['fg', 'fzf_hl'],
"  \'fg+': ['fg', 'fzf_fgp'],
"  \'hl+': ['fg', 'fzf_hlp'],
"  \'info': ['fg', 'fzf_info'],
"  \'prompt': ['fg', 'fzf_prompt'],
"  \'pointer': ['fg', 'fzf_pointer'],
"  \'spinner': ['fg', 'fzf_spinner'] }

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

"map the F2 key to switch between header and source (C/C++)
map <F5> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>


" same as above except open the header/source in a vertical split window
map <C-F5> :vsp %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>


" same as above except open the header/source in a vertical split window
map <S-F5> :sp %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
 
" map F9 to open vimrc
noremap <silent> <F9> :e $MYVIMRC<CR>
noremap <silent> <C-F9> :vsp $MYVIMRC<CR>
noremap <silent> <S-F9> :sp $MYVIMRC<CR>

"disable the arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

:imap jj <Esc>

"map <C-B> :b#<CR>
"map <C-S> :w!<CR>

map <C-B> :wa<CR> :make<CR><CR>

" USING MARKS:
"   - m[letter] places a mark at the current position.
"   - using `[letter] returns you to the mark placed.
"   - using capital marks allows traversal through different files.

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Reloads vimrc after saving but keep cursor position
if !exists('*ReloadVimrc')
    fun! ReloadVimrc()
       source $MYVIMRC
    endfun
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimrc()

