" *****************************************
" LeoLuz vimrc configs                    *
" Feel free to use this file as you wish  *
"                                         *
" email: leonardo dot la at gmail dot com *
" twitter: @leo_luz                       *
"                                         *
" *****************************************

set nocompatible
syntax on

" *********************
" OS specific section *
" *********************

if has("gui_gtk2")
    set guifont=Monospace\ 11
    let vimhome = "~/.vim"
    let cfgfile = ".vimrc"

elseif has("mac")
    set macmeta
    set guifont=Menlo:h15
    let vimhome = "~/.vim"
    let cfgfile = ".vimrc"

elseif has("gui_win32")
    set guifont=Dejavu\ Sans\ Mono:h13,Consolas:h12
    let vimhome = "~/vimfiles"
    let cfgfile = "_vimrc"

else
    let vimhome = "~/.vim"
    let cfgfile = ".vimrc"
end

" ****************
" Plugin Section *
" ****************
"
if has('vim_starting')
    set nocompatible
    let &rtp.=",".vimhome."/bundle/neobundle.vim"
endif

if has('gui_running')

    call neobundle#begin(expand(vimhome."/bundle/"))

    " Let NeoBundle manage NeoBundle
    NeoBundleFetch 'Shougo/neobundle.vim'

    " My bundles
    NeoBundle 'tpope/vim-rails'
    NeoBundle 'tpope/vim-fugitive'
    NeoBundle 'msanders/snipmate.vim.git'
    NeoBundle 'scrooloose/nerdtree.git'
    NeoBundle 'scrooloose/nerdcommenter.git'
    NeoBundle 'tpope/vim-markdown.git'
    NeoBundle 'tpope/vim-surround.git'
    NeoBundle 'tpope/vim-repeat.git'
    NeoBundle 'vim-ruby/vim-ruby.git'
    NeoBundle 'tpope/vim-cucumber.git'
    NeoBundle 'leoluz/xmledit.git'
    NeoBundle 'leoluz/snipmate-snippets.git'
    NeoBundle 'kien/ctrlp.vim.git'
    NeoBundle 'vim-scripts/taglist.vim.git'
    NeoBundle 'jistr/vim-nerdtree-tabs'
    NeoBundle 'bling/vim-airline'
    NeoBundle 'fatih/vim-go'
    NeoBundle 'Shougo/neocomplete.vim'

    call neobundle#end()
    filetype plugin indent on
    NeoBundleCheck
end

if has("gui_running")
    colorscheme candycode       " other nice colorschemes to try: molokai, fruity
    set cursorline              " highlight current line
    set cm=blowfish             " crypt method
end

" ****************
" script section *
" ****************

" Add source navigation on python core livraries
if has("python")
python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
endif

" ****************
" Config section *
" ****************

" NERDTree configuration
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_open_on_gui_startup = 0

" CtrlP configuration
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_by_filename = 1
let g:ctrlp_open_multi = '1'
let g:ctrlp_arg_map = 1

" Snipmate configuration
let g:snippets_dir=vimhome."/bundle/snipmate-snippets"
let g:snips_author="Leonardo Luz"

" Taglist configuration
let Tlist_Compact_Format = 1
let Tlist_Use_Right_Window = 1
let Tlist_Use_SingleClick = 1
let Tlist_Show_One_File = 1

" NeoComplete configuration
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

let mapleader=" "
set laststatus=2
set wildignore+=*.bak,*.pyc,*.py~,*.pdf,*.so,*.gif,*.jpg,*.flv,*.class,*.jar,*.png,*/tools/*,*/docs/*,*.swp,*/.svn/*,*/.git/*
set wildmode=list:longest
set wildmenu
set anti
set textwidth=0
set tabstop=4
set softtabstop=4
set shiftwidth=4
set encoding=utf-8
set expandtab
set backspace=indent,eol,start
set smarttab
set smartindent
set showmode
set fileformats=unix,dos
set showmatch       " Show matching brackets.
set autowrite       " Automatically save before commands like :next and :make
set ignorecase      " Do case insensitive matching
set incsearch       " Incremental search
set wmh=0           " set winminheight to 0
set ruler
set linebreak
set guioptions-=T   " Turn toolbar off
set guioptions-=m   " Turn menubar off
set guioptions-=r   " remove right-hand scroll bar
set virtualedit=all
set smartcase       " Do smart case matching
set mousemodel=popup
set foldmethod=indent
set foldlevel=999
set guitablabel=%N\ %t\ %M
set autoread
compiler ruby

" *****************
" Mapping section *
" *****************

" Maps for yanks
map Y y$
nnoremap y "+y
nnoremap p "+p
nnoremap dd "+dd
vnoremap y "+y
vnoremap d "+d

" Maps for buffer navigation
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>h <C-W>h
nnoremap <leader>l <C-W>l
nnoremap <leader>m <C-W>_
nnoremap <leader>n <C-W>=

" Maps for tabs specific funcionalities
nnoremap L :tabnext<CR>
nnoremap H :tabprevious<CR>
map <M-t> :tabnew<CR>

" Omni completion maps
inoremap <C-Space> <C-x><C-o>
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" Rails specific mappings
inoremap <M-=> <%=  %><ESC>hhi
inoremap <M--> <%  -%><ESC>hhhi
nnoremap gr  :R<CR>
nnoremap grt :RT<CR>
nnoremap ga  :A<CR>
nnoremap gat :AT<CR>

" Automatically surround brackets, parentheses, etc..
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap ( ()<ESC>i
inoremap <C-l> <ESC>A

" NerdCommenter maps
nmap <silent><leader>/ <plug>NERDCommenterToggle
vmap <leader>/ <plug>NERDCommenterToggle
vmap <leader>c <plug>NERDCommenterSexy

" Plugin maps
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent><leader>q :NERDTreeTabsToggle<CR>
nnoremap <silent><leader>s :set spell spelllang=pt<CR>

" Misc maps
map <silent><C-Left> <C-T>
map <silent><C-Right> <C-]>
inoremap <C-s> <ESC>:w<CR>
nnoremap <C-s> :w<CR>
nnoremap - :q<CR>
nnoremap <C-_> :q!<CR>
vmap <silent><C-s> :sort<CR>
imap <silent><C-Del> <ESC>dea
nnoremap <CR> o<ESC>
nnoremap j gj
nnoremap k gk
inoremap <C-a> <ESC>ggvG$
nnoremap <silent><leader>a ggvG$
exec "nmap <leader>r :source ~/".cfgfile." <CR>:echo 'Vim configs reloaded!' <CR>"
