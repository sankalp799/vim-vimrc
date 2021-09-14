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

set magic " Set magic on, for regex

" faster redrawing
set ttyfast

" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

highlight ColorColumn ctermbg=0 guibg=lightgrey

set t_Co=256


set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2  " always display the status line


call vundle#begin('~/.vim/plugged')

Plugin 'git@github.com:fugalh/desert.vim.git'

Plugin 'zxqfl/tabnine-vim'
Plugin 'dNitro/vim-pug-complete'
Plugin 'alvan/vim-closetag'
Plugin 'mattn/emmet-vim'
Plugin 'https://github.com/ayu-theme/ayu-vim.git'
"Plugin 'pangloss/vim-javascript'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'powerline/fonts'
Plugin 'jiangmiao/auto-pairs'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'morhetz/gruvbox'
Plugin 'jremmen/vim-ripgrep'  
"Plugin 'tpope/vim-fugitive'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-utils/vim-man'
Plugin 'lyuts/vim-rtags'
Plugin 'mbbill/undotree'
"Plugin 'https://github.com/kien/ctrlp.vim.git'
"Plugin 'https://github.com/ycm-core/YouCompleteMe.git'
Plugin 'lifepillar/vim-solarized8'
"Plugin 'https://github.com/preservim/nerdtree.git'

Plugin 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" additional 
Plugin 'kien/ctrlp.vim' " fuzzy find files
Plugin 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
Plugin 'benmills/vimux'
Plugin 'tpope/vim-fugitive' " the ultimate git helper
Plugin 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'

" colorschemes
Plugin 'chriskempson/base16-vim'
call vundle#end()

call glaive#Install()

filetype plugin indent on 

"set termguicolors
"set background=dark
"colorscheme solarized8_flat
let base16colorspace=256  " Access colors present in 256 colorspace"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set background=dark
colorscheme desert


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
"   mapping
""""""""""""""""""""""""""""""""""""""
map <leader>ev :e! ~/.vimrc<cr> " edit ~/.vimrc

map <leader>wc :wincmd q<cr>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk

" helpers for dealing with other people's code
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nmap \s :set ts=4 sts=4 sw=4 et<cr>

"""""""""""""""""""""""""""""""""""""""
"   LEADERS 
"
"""""""""""""""""""""""""""""""""""""""
map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""
"                NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>



" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree


""""""""""""""""""""""""""""""""""""""""""""""
"               GOOGLE AUTO FORMATTER
""""""""""""""""""""""""""""""""""""""""""""""
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

" map fuzzyfinder (CtrlP) plugin
" nmap <silent> <leader>t :CtrlP<cr>
nmap <silent> <leader>r :CtrlPBuffer<cr>
let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'

" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$'
            \ }

" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2

