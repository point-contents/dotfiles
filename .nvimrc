syntax on

set noic
set relativenumber
set noerrorbells
set tabstop=4 
set softtabstop=2
set shiftwidth=4
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set background=light
filetype on
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
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', {'do': 'npm install'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'albfan/ag.vim'
Plug 'rstacruz/vim-closer'
call plug#end()

map<C-n> :NERDTreeToggle<CR>
autocmd vimenter * colorscheme gruvbox
" let g:airline_theme='agnoster'

" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respect .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" copy and paste with normal ctrl c & ctrl b
vmap <C-c> "+y
nmap <C-b> "+p

" use tab for coc completerion why this isnt default? who the fuck knows?
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
let col = col('.') - 1
 return !col || getline('.')[col - 1]  =~ '\s'
 endfunction

 inoremap <silent><expr> <Tab>
	   \ pumvisible() ? "\<C-n>" :
	   \ <SID>check_back_space() ? "\<Tab>" :
	   \ coc#refresh()

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
