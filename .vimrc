syntax on

set noic
set relativenumber
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'vimlab/split-term.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'stevearc/vim-arduino'

call plug#end()

map<C-n> :NERDTreeToggle<CR>
autocmd vimenter * colorscheme gruvbox
let g:airline_theme='agnoster'

" copy and paste with normal ctrl c & ctrl b
vmap <C-c> "+y
nmap <C-b> "+p

" buffer navigation
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" for 2 spaces in yaml stolen from 
" https://www.arthurkoziel.com/setting-up-vim-for-yaml/
 autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
