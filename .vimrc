" Settings {{{
" No's {{{{
set nocompatible " Don't try to be vi compatible"
set nobackup " No backup files
set nowritebackup " No write backup
set noswapfile " No swap file
" }}}}

" Plugin configuration {{{
filetype off " force plugins to load correctly when it is turned back on
" execute pathogen#infect()
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-python/python-syntax'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'

call plug#end()

syntax on                 " Turn on syntax highlighting 
filetype plugin indent on " For plugins to load correctly

" NERDTree
map <leader>' :NERDTreeToggle<cr>

" Lightline config

if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" Python Syntax
let g:python_highlight_all = 1
let g:python_highlight_builtins = 1

" }}}

set modelines=0  " Security
set number       " Show line numbers
set ruler        " Show file stats
set visualbell   " Blink cursor on error instead of beeping (grr)
set encoding=utf-8
set autoread     " Autoload files that have changed outside of vim
set hidden       " Allow hidden buffers
set ttyfast      " Rendering
set laststatus=2 " Status bar
set shortmess+=I " Don't show intro
set wildmenu     " autocomplete for cmd menu (e.g. :e ~/path/to/file)
set lazyredraw   " redraw only when we need to 
set showmatch    " highlight matching [{()}] 
set history=100  " Command history
set noshowmode   " no more --insert--
set showcmd      " Show incomplete commands


" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Use system clipboard
" http://stackoverflow.com/questions/8134647/copy-and-paste-in-vim-via-keyboard-between-different-mac-terminals
set clipboard+=unnamed
" Whitespace {{{{
set wrap
"set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
" }}}}

" Cursor motion {{{{
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim
" }}}}

" Always highlight column 80 so it's easier to see where
" cutoff appears on longer screens
autocmd BufWinEnter * highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,120"

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Close all folds when opening a new buffer
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM

" Last line
set showcmd

" Searching {{{{
nnoremap / /\v
vnoremap / /\v
set hlsearch " highlight search matches
set incsearch " search as you type
set ignorecase " don't need \c escape chars
set smartcase " ignore case?
set showmatch
map <leader><space> :let @/=''<cr> " clear search
" }}}}

" Textmate holdouts


" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set background=dark
set t_Co=256
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized
" }}}

" Mappings {{{
let mapleader = ","
" Formatting
map <leader>q gqip

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" remap ctrl + [hjkl] to switch split buffers
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Buffers
map <leader>yt :ls<cr>

" Buffers (runs the delete buffer command on all open buffers)
map <leader>yd :bufdo bd<cr>

" Make handling vertical/linear Vim windows easier
map <leader>w- <C-W>- " decrement height
map <leader>w+ <C-W>+ " increment height
map <leader>w] <C-W>_ " maximize height
map <leader>w[ <C-W>= " equalize all windows

" Make splitting Vim windows easier
map <leader>; <C-W>s
map <leader>` <C-W>v

" map fzf.vim to leader+f
map <Leader> :Files<cr>

" Tmux style window selection
map <Leader>ws :ChooseWin<cr>

" Switch between vim tabs
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt

" Create new tabs
map <leader>t :tabnew<CR>
map <leader>T :tabe  

" }}}
