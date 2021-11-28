set rtp+=~/.vim/bundle/Vundle.vim

syntax on

set encoding=utf8
set colorcolumn=72
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
set nocompatible              " be iMproved, required
filetype off 
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

set laststatus=2  " always display the status line

call vundle#begin()

Plugin 'ryanoasis/vim-devicons'
Plugin 'Syntastic'
Plugin 'frazrepo/vim-rainbow'
Plugin 'itchyny/lightline.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'powerline/fonts'
Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'lifepillar/vim-solarized8'
Plugin 'zxqfl/tabnine-vim'
Plugin 'dNitro/vim-pug-complete'
Plugin 'alvan/vim-closetag'
Plugin 'mattn/emmet-vim'
Plugin 'https://github.com/ayu-theme/ayu-vim.git'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-utils/vim-man'
Plugin 'lyuts/vim-rtags'
Plugin 'mbbill/undotree'
Plugin 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call vundle#end()            " required

filetype plugin indent on    " required
set termguicolors
let base16colorspace=256  " Access colors present in 256 colorspace"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set background=dark
let ayucolor='mirage'
colorscheme ayu


"""""""""""""""""""""""""""""""""""""""""""""""
"                LIGHT LINE
"""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'ayu',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }



""""""""""""""""""""""""""""""""""""""""""""""""
"    ------ key binding & mapping ----
""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> w :w<cr>
nnoremap <silent> s :source%<cr>
nnoremap <silent> q :q<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""
"                NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>



" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

"""""""""""""""""""""""""""""""""""""""""""""
"""""""""""  SYNTASTIC SETTING  """"""""""""
""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1



let g:rainbow_active = 1
