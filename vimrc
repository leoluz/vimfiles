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

elseif has("mac")
    set macmeta
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
if has('vim_starting')
    set nocompatible
    let &rtp.=",".vimhome."/bundle/neobundle.vim"
endif

call neobundle#begin(expand(vimhome."/bundle/"))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My bundles
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'tpope/vim-markdown.git'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'tpope/vim-repeat.git'
NeoBundle 'vim-ruby/vim-ruby.git'
NeoBundle 'tpope/vim-cucumber.git'
NeoBundle 'leoluz/xmledit.git'
NeoBundle 'kien/ctrlp.vim.git'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'bling/vim-airline'
NeoBundle 'tfnico/vim-gradle'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'fatih/vim-go'
NeoBundle 'majutsushi/tagbar'
if has("lua")
    NeoBundle 'Shougo/neocomplete.vim'
end

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

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
    set cm=blowfish             " crypt method
    colorscheme molokai " Other nice colorschemes to try: candycode, molokai, fruity
else
    colorscheme jellybeans
end

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
compiler ruby

" Plugin configs

" NERDTree configuration
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_open_on_gui_startup = 0

" CtrlP configuration
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_by_filename = 1
let g:ctrlp_open_multi = '1'
let g:ctrlp_arg_map = 1

" Ultisnips configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Taglist configuration
let Tlist_Compact_Format = 1
let Tlist_Use_Right_Window = 1
let Tlist_Use_SingleClick = 1
let Tlist_Show_One_File = 1

" DelimitMate configuration
let delimitMate_expand_cr = 1

" NeoComplete configuration
let g:neocomplete#enable_at_startup = 1

" go-vim configuration
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gi <Plug>(go-info)
au FileType go nmap <Leader>gs <Plug>(go-implements)
au FileType go nmap <Leader>gd <Plug>(go-doc-browser)
au FileType go nmap <Leader>gr <Plug>(go-rename)
au FileType go nmap <Leader>gc <Plug>(go-callers)
au FileType go nmap <Leader>gs <Plug>(go-implements)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <leader>x <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>i :GoImports<CR>

" air-line configuration
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_theme = 'tomorrow'
let g:airline_section_warning = ''
let g:airline_inactive_collapse = 0
let g:airline_left_sep = '▄'
let g:airline_right_sep = '▄'
let g:airline_left_alt_sep = '→'
let g:airline_right_alt_sep = '←'
let g:airline_symbols.linenr = '│'
let g:airline_symbols.branch = '±'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'P'
let g:airline_symbols.readonly = '!'

" *****************
" Mapping section *
" *****************

"" Maps for buffer navigation
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>h <C-W>h
nnoremap <leader>l <C-W>l
nnoremap <leader>m <C-W>_
nnoremap <leader>n <C-W>=

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

"" Auto center
nmap n nzz
nmap N Nzz

"" Misc maps
map <F5> :setlocal spell! spelllang=en_us<CR>

inoremap <C-s> <ESC>:w<CR>
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>
inoremap <C-l> <ESC>A

nnoremap j gj
nnoremap k gk
nnoremap <leader>m '
nnoremap gb `.
nnoremap <C-s> :w<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>
nnoremap <UP> ddkP
nnoremap <Down> ddp
nnoremap <CR> o<ESC>
nnoremap <leader>s z=
nnoremap - :bdelete<CR>
nnoremap <C-_> :q!<CR>
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>r :source $MYVIMRC<CR>:echo 'Vim configs reloaded!' <CR>
nnoremap <silent><leader>a ggvG$

inoremap <silent><C-Del> <ESC>dea
inoremap <C-a> <ESC>ggvG$
inoremap <silent><C-Del> <ESC>dea

vmap <silent><C-s> :sort<CR>
