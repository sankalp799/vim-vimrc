set rtp+=~/.vim/bundle/Vundle.vim

syntax on

set exrc
set guicursor=
set hidden
set nohlsearch
set termguicolors
set scrolloff=8
set number
set tabstop=4 softtabstop=4
set shiftwidth=4
set autoindent
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set signcolumn=yes
set cmdheight=2

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set t_Co=256


set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2  " always display the status line


call vundle#begin('~/.vim/plugged')

Plugin 'https://github.com/ayu-theme/ayu-vim.git'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'powerline/fonts'
Plugin 'jiangmiao/auto-pairs'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'morhetz/gruvbox'
Plugin 'jremmen/vim-ripgrep'  
Plugin 'tpope/vim-fugitive'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-utils/vim-man'
Plugin 'lyuts/vim-rtags'
Plugin 'mbbill/undotree'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/ycm-core/YouCompleteMe.git'
Plugin 'lifepillar/vim-solarized8'
Plugin 'https://github.com/preservim/nerdtree.git'

Plugin 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call vundle#end()
filetype plugin indent on 

set termguicolors
set background=dark
colorscheme solarized8



if executable('rg')
    let g:rg_derive_root='true'
endif

let g:airline_powerline_fonts = 1

let mapleader = " "
let g:netrw_browse_split=2
let g:newtrw_banner = 0

let g:ctrlp_use_caching = 0
let g:netrw_winsize = 25


let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0


""""""""""""""""""""""""""""""""""""""
"   airline-theme-setting
""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""
"   LEADERS 
"
"""""""""""""""""""""""""""""""""""""""
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

