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
    set guifont=Ubuntu\ Mono\ 15,Monospace\ 13
    let vimhome = "~/.vim"
elseif has("gui_vimr")
    let vimhome = "~/.vim"
elseif has("gui_macvim")
    set macmeta
    set anti
    set guifont=Menlo:h15
    let vimhome = "~/.vim"
elseif has("gui_win32")
    set guifont=Dejavu\ Sans\ Mono:h13,Consolas:h12
    let vimhome = "~/vimfiles"
else
    let vimhome = "~/.vim"
end

" ****************
" Plugin Section *
" ****************
"
let deinhome = vimhome."/vendor/"
let deinrepo = deinhome."/repos/github.com/Shougo/dein.vim"
let &rtp.=",".deinrepo

if dein#load_state(deinhome)
  call dein#begin(deinhome)
  call dein#add(deinrepo)

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('tpope/vim-fugitive')

  call dein#add('scrooloose/nerdtree.git')
  call dein#add('scrooloose/nerdcommenter.git')
  call dein#add('tpope/vim-markdown.git')
  call dein#add('tpope/vim-surround.git')
  call dein#add('tpope/vim-repeat.git')
  call dein#add('vim-ruby/vim-ruby.git')
  call dein#add('tpope/vim-cucumber.git')
  call dein#add('leoluz/xmledit.git')
  call dein#add('kien/ctrlp.vim.git')
  call dein#add('jistr/vim-nerdtree-tabs')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('tfnico/vim-gradle')
  call dein#add('Raimondi/delimitMate')
  call dein#add('fatih/vim-go')
  call dein#add('majutsushi/tagbar')
  call dein#add('martinda/Jenkinsfile-vim-syntax')
  call dein#add('qpkorr/vim-bufkill')
  call dein#add('tomasr/molokai')
  call dein#add('Shougo/deoplete.nvim')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

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

" Vim configs

if has("gui_running")
    set cursorline              " highlight current line
    set relativenumber
    set cm=blowfish2            " crypt method
end

colorscheme molokai " Other nice colorschemes to try: candycode, molokai, fruity
set fillchars+=vert:\ 
let mapleader=" "
set nohlsearch
set laststatus=2
set wildignore+=*.bak,*.pyc,*.py~,*.pdf,*.so,*.gif,*.jpg,*.flv,*.class,*.jar,*.png,*/tools/*,*/docs/*,*.swp,*/.svn/*,*/.git/*
set wildmode=list:longest
set wildmenu
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
set showmatch       " show matching brackets.
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
set listchars=tab:→\ ,trail:·,eol:↩
set list
set hidden          " Don't autosave buffers
set splitbelow
set splitright
compiler ruby

" ****************
" Plugin configs *
" ****************

" Netrw (:Explore) configuration
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" NERDTree configuration
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_open_on_gui_startup = 0

" CtrlP configuration
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_by_filename = 1
let g:ctrlp_open_multi = '1'
let g:ctrlp_arg_map = 1
let g:ctrlp_max_depth = 50

" Taglist configuration
let Tlist_Compact_Format = 1
let Tlist_Use_Right_Window = 1
let Tlist_Use_SingleClick = 1
let Tlist_Show_One_File = 1

" Tagbar configuration
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

" DelimitMate configuration
let delimitMate_expand_cr = 1

" DeoComplete configuration
let g:deoplete#enable_at_startup = 1

" go-vim configuration
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gi <Plug>(go-info)
au FileType go nmap <Leader>gs <Plug>(go-implements)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gr <Plug>(go-rename)
au FileType go nmap <Leader>gc <Plug>(go-callers)
au FileType go nmap <Leader>gs <Plug>(go-implements)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-def-pop)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>x <Plug>(go-run)
au FileType go nmap <Leader>i :GoImports<CR>

" Set working directory to the current file
autocmd BufEnter * silent! lcd %:p:h

" *****************
" Mapping section *
" *****************

"" Maps for window management
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>h <C-W>h
nnoremap <leader>l <C-W>l
nnoremap <leader>m <C-W>_
nnoremap <leader>= <C-W>=
nnoremap <leader>. 10<C-W>>
nnoremap <leader>, 10<C-W><

"" Maps for tabs specific funcionalities
nnoremap L :tabnext<CR>
nnoremap H :tabprevious<CR>
map <M-t> :tabnew<CR>

"" Omni completion maps
inoremap <C-Space> <C-x><C-o>
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

"" Rails specific mappings
inoremap <M-=> <%=  %><ESC>hhi
inoremap <M--> <%  -%><ESC>hhhi
nnoremap gr  :R<CR>
nnoremap grt :RT<CR>
nnoremap ga  :A<CR>
nnoremap gat :AT<CR>

"" NerdCommenter maps
nmap <silent><leader>/ <plug>NERDCommenterToggle
vmap <leader>/ <plug>NERDCommenterToggle

"" Tagbar maps
nnoremap <leader>w :TagbarToggle<CR>

"" NERDTree maps
nnoremap <silent><leader>q :NERDTreeTabsToggle<CR>

"" Format JSON
nnoremap <silent><leader>fj :%!python -m json.tool<CR>

"" Misc maps
map <F5> :setlocal spell! spelllang=en_us<CR>

"" CtrlP buffer
nnoremap <C-i> :CtrlPBuffer<CR>

inoremap <C-s> <ESC>:w<CR>
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>
inoremap <C-l> <ESC>A

nnoremap Y y$
nnoremap j gj
nnoremap k gk
nnoremap gb `.
nnoremap <C-s> :w<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>
nnoremap <UP> ddkP
nnoremap <Down> ddp
nnoremap <CR> o<ESC>
nnoremap <leader>s z=
nnoremap - :BD<CR>
nnoremap <C-_> :q!<CR>
nnoremap <silent> <leader>v :e $MYVIMRC<CR>
nnoremap <silent> <leader>r :source $MYVIMRC<CR>:echo 'Vim configs reloaded!' <CR>
nnoremap <silent><leader>a ggvG$

inoremap <silent><C-Del> <ESC>dea
inoremap <C-a> <ESC>ggvG$
inoremap <silent><C-Del> <ESC>dea

vmap <silent><C-s> :sort<CR>
