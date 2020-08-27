set nocompatible

syntax enable

set t_Co=256
let mapleader=","
let maplocalleader="\\"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" {{{
set autoindent
set autoread
set autowriteall
set backspace=indent,eol,start
set encoding=UTF-8
set hidden
set history=1000
set laststatus=2
set lazyredraw
set linebreak
set nolist
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set matchtime=3
set modeline
set modelines=5
set mouse=a
set noerrorbells
set notimeout
set number
set ruler	
set shiftround
set shiftwidth=2
set showcmd
set showmatch
set showmode
set splitbelow
set splitright
set synmaxcol=512
set termencoding=utf-8
set textwidth=0
set title
set ttimeout
set ttimeoutlen=10
set undolevels=1000
set undoreload=10000
set visualbell
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/**,*.pyc,*/.bower-cache/**,*/.sass-cache/**
set wildmenu
set wrap
set wrapmargin=0
set noswapfile 		" No swap files because they cause clutter and YOLO
set hls                 " highlight matches without moving

set t_vb=               " disable that annoying flash and bell

set tabstop=8 softtabstop=0 expandtab smarttab

" }}}

" Associate html syntax with .template files
au BufNewFile,BufRead *.template set filetype=html
" Highlight Rofi Template files using CSS
au BufNewFile,BufRead *.rasi set filetype=css
au BufNewFile,BufRead *polybar/config set filetype=dosini

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" {{{
filetype off
call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'srcery-colors/srcery-vim'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chriskempson/base16-vim'

call plug#end()
filetype plugin indent on

" Color Schemes {{{
colorscheme nord
"colorscheme base16-default-dark
"}}}

" NerdTree {{{
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.DS_Store$']
let NERDTreeWinSize = 30
let NERDTreeShowHidden=1
"}}}

" FZF {{{
map <C-p> :FZF<CR>
" The below command isn't working even though all docs say to try it
" let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g""'
"}}}

" NerdCommenter {{{
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'
" }}}

" vim-airline config {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme = 'deus'
"}}}

" JS Pretty Template {{{
"autocmd FileType javascript JsPreTmpl html
" }}}

" GitGutter {{{
"set signcolumn=yes
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_modified_removed = ''

"let g:gitgutter_sign_added = ''
"let g:gitgutter_sign_modified = ''
"let g:gitgutter_sign_removed = ''
"let g:gitgutter_sign_modified_removed = ''
"}}}
"
" Ale {{{
let g:ale_python_flake8_options='--ignore=E501' 
let g:ale_linters = {
\    'javascript': ['eslint'],
\    'jsx': ['eslint'],
\    'python': ['flake8']
\}
let g:ale_javascript_eslint_use_global=1
"let g:ale_sign_error = ''
"let g:ale_sign_warning = ''
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_column_always = 1
let g:ale_open_list=1
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['python'] = ['black']
let g:ale_python_black_options = '--line-length 120'
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
"}}}

" VimDevIcons {{{
let g:webdevicons_enable = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsOS = 'Darwin'
" }}}

"}}}

