set nocompatible
syntax enable
set t_Co=256
let mapleader=","
let maplocalleader="\\"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoVim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme colorsbox-material

" highlight Normal ctermfg=grey ctermbg=black
highlight Comment cterm=italic
highlight Normal guibg=none
highlight NonText guibg=none


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" {{{
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Plugins {{{
Plugin 'Raimondi/delimitMate'
Plugin 'amirh/HTML-AutoCloseTag'
Plugin 'itchyny/lightline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'gregsexton/MatchTag'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
" }}}

" Syntax Highlighting {{{
Plugin 'leafgarland/typescript-vim'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'digitaltoad/vim-jade'
Plugin 'fatih/vim-go'
Plugin 'groenewege/vim-less'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'jiangmiao/simple-javascript-indenter'
Plugin 'kchmck/vim-coffee-script'
Plugin 'othree/html5-syntax.vim'
Plugin 'tpope/vim-markdown'
" Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'
Plugin 'lilydjwg/colorizer'
Plugin 'flazz/vim-colorschemes'
Plugin 'Quramy/vim-js-pretty-template'
" Plugin 'kenwheeler/glow-in-the-dark-gucci-shark-bites-vim'
" }}}

call vundle#end()
filetype plugin indent on	" load file-type specific indent files
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" {{{
set autoindent
set autoread
set autowriteall
set backspace=indent,eol,start
set encoding=utf-8
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
set shiftwidth=4
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
set hls

set tabstop=8 softtabstop=0 expandtab smarttab

" }}}

" Associate html syntax with .template files
au BufNewFile,BufRead *.template set filetype=html

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Specific Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" {{{
" NerdTree {{{
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.DS_Store$']
let NERDTreeWinSize = 50
let NERDTreeShowHidden=0
"}}}

" CtrlP {{{
" let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|^log\|tmp|node_modules$',
  \ 'file': '\.exe$\|\.so$\|\.dat|\.pyc$'
  \ }
""}}}

" Gitgutter {{{
let g:gitgutter_sign_column_always=1
"}}}

" Ale {{{
let g:ale_python_pylint_args='--ignore=E501' 
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
"}}}

" let g:syntastic_javascript_checkers = ['eslint']

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 1
"}}}

" Typescript-Vim {{{
let g:typescript_indent_disable = 1
"}}}

" vim airline {{{
let g:airline#extensions#tabline#enabled = 1            " Show buffer list up top
let g:airline#extensions#tabline#fnamemod = ':t'        " Only show the filename
" let g:airline_theme = 'sharkbites'
" }}}

" JS Pretty Template {{{
autocmd FileType javascript JsPreTmpl html
" }}}

"}}}
