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
" Vundle Section *
" ****************
if has("gui_running")

    filetype off
    let &rtp.=",".vimhome."/bundle/Vundle.vim"
    call vundle#begin()

    Plugin 'gmarik/Vundle.vim'
    Plugin 'vim-scripts/AutoComplPop.git'
    Plugin 'tpope/vim-rails'
    Plugin 'tpope/vim-fugitive'
    Plugin 'msanders/snipmate.vim.git'
    Plugin 'scrooloose/nerdtree.git'
    Plugin 'scrooloose/nerdcommenter.git'
    Plugin 'tpope/vim-markdown.git'
    Plugin 'tpope/vim-surround.git'
    Plugin 'tpope/vim-repeat.git'
    Plugin 'vim-ruby/vim-ruby.git'
    Plugin 'tpope/vim-cucumber.git'
    Plugin 'leoluz/xmledit.git'
    Plugin 'leoluz/snipmate-snippets.git'
    Plugin 'kien/ctrlp.vim.git'
    Plugin 'vim-scripts/taglist.vim.git'
    Plugin 'jistr/vim-nerdtree-tabs'
    Plugin 'bling/vim-airline'
    Plugin 'fatih/vim-go'

    call vundle#end()
    filetype plugin indent on
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

" AutoComplPop configuration
let g:acp_behaviorKeywordLength = 4
let g:acp_enableAtStartup = 1
let g:acp_completeoptPreview = 1

" NERDTree configuration
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_open_on_gui_startup = 0

" CtrlP configuration
"let g:ctrlp_root_markers = ['pom.xml', 'src']
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

map Y y$
nnoremap y "+y
nnoremap p "+p
nnoremap dd "+dd
vnoremap y "+y
vnoremap d "+d
nnoremap <CR> o<ESC>
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <silent><C-Left> <C-T>
map <silent><C-Right> <C-]>
imap <C-s> <ESC>:w<CR>
nmap <C-s> :w<CR>
vmap <silent><C-s> :sort<CR>
imap <silent><C-Del> <ESC>dea
inoremap <C-k> <ESC>
nnoremap j gj
nnoremap k gk
inoremap <C-a> <ESC>ggvG$
nnoremap <silent><leader>e ggvG$

" Maps for tab specific funcionalities
nnoremap L :tabnext<CR>
nnoremap H :tabprevious<CR>
map <M-t> :tabnew<CR>
nmap <silent><leader>n :tabnew<CR>

" Remap code completion to Ctrl-Space
inoremap <C-Space> <C-x><C-u>
inoremap <C-j> <C-n>

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

nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent><leader>q :NERDTreeTabsToggle<CR>
nnoremap <silent><leader>s :set spell spelllang=pt<CR>
exec "nmap <leader>r :source ~/".cfgfile." <CR>:echo 'Refresh!' <CR>"

nnoremap - :q<CR>
nnoremap <C-_> :q!<CR>

map <silent><leader>c <plug>NERDCommenterToggle
map <silent><leader>x <plug>NERDCommenterSexy
map <silent><leader>z <plug>NERDCommenterMinimal
