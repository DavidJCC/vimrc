call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-fugitive'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'Raimondi/delimitMate'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'mklabs/split-term.vim'
    Plug 'dkprice/vim-easygrep'
    Plug 'bling/vim-bufferline'
call plug#end()

"set laststatus=2
let g:airline_theme='wombat'

" Output the contents from a cmd command in to a new buffer
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction


" Switch between source and header file for C++ projects
" Errors if the file doesn't exist. Could have it silently do this?
function! SwitchSourceHeader()
  if (expand ("%:e") == "cpp")
    find %:t:r.h
  else
    find %:t:r.cpp
  endif
endfunction
"
""Auto-update vimrc
augroup VimReload
   autocmd!
   autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" Enable filetype detection
filetype plugin indent on

" Change the leader key to ','
let mapleader = ","

" Enable syntax highlighting
syntax enable

" Display the statusline
set laststatus=2

" Show relative line numbers
set number
set relativenumber

" Remove tool and scroll bars
set guioptions-=m  
set guioptions-=T  
set guioptions-=r  
set guioptions-=L  

" Set tabs to equal 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Disable error/visual bell
set belloff=all
set visualbell
set t_vb=

" Set the font
let g:guifont="Anonymous Pro:h2"

"Avoid using the escape key
"inoremap ;; <esc>

set t_Co=256

if (has("termguicolors"))
    set termguicolors
endif

"colorscheme OceanicNext

"" Set the colour scheme
colorscheme jellybeans
let g:jellybeans_use_lowcolor_black = 1
let g:jellybeans_use_term_italics = 1

" Quick open vimrc
nmap <c-F9> :vsplit $MYVIMRC<CR>
nmap <s-F9> :split $MYVIMRC<CR>
nmap <F9> :e $MYVIMRC<CR>

" Map header/source switch
nmap <F6> :call SwitchSourceHeader()<CR>

" Toggle NERDTree
map <Space> :NERDTreeToggle<CR>

" Open new file in split windows
map <s-F5> :split<CR>

map <c-F5> :vsplit<CR>
map <c-o> :vsplit<CR>

" Easy window switching
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

" CtrlP mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Show all open buffers and show option to open
noremap <C-B> :buffers<CR>:buffer<Space>

" Open terminal and build current project
"noremap <F2> :VTerm build.bat<CR>
"noremap <c-F2> :!build debug<CR>

" Set ctrl-s to save and save and exit
noremap <C-S> :w<CR>
noremap <C-X> :x<CR>

" Set readonly file writable
noremap <C-F1> :!attrib -R %<CR><CR>

" Go to local function definition
noremap <F12> gD
noremap <C-F12> g*

" Project specific commands
noremap <C-F1> :Shell build.bat<CR><CR>
noremap <F1> :!build.bat<CR>
noremap <F2> :!run devenv build\winmain.exe<CR><CR>
noremap <F3> :!devenv build\winmain.exe<CR><CR>

" Paste from the windows clipboard
nnoremap <leader>p "+p


