" Allow automatic sourcing of .vimrc after write-quit
autocmd! bufwritepost .vimrc source %

" Allow mouse usage
" set mouse=a
" Backspace
set bs=2

" Rebind <Leader> key
let mapleader = ","

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E : qa!<CR>  " Quit all windows

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Bind Ctrl+<movement> keys to move around the windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Map sort function to a key
vnoremap <Leader>s :sort<CR>

" Move code blocks more easily
vnoremap < <gv  "better indentation
vnoremap > >gv  "better indentation

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+%/

" leave space for whitespace stuff

" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on

" Show line numbers and length
set number  " show line numbers
set tw=79   " width of doc (used by gd):
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Real programmers don't use tabs; spaces only
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make searh case insensitive
set hlsearch 
set incsearch
set ignorecase
set smartcase

" Disable backup/swp files for file system watchers
set nobackup
set nowritebackup
set noswapfile

execute pathogen#infect()
call pathogen#helptags()
