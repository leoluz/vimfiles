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
let deinhome = vimhome."/vendor"
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
  call dein#add('fatih/vim-go')
  call dein#add('majutsushi/tagbar')
  call dein#add('martinda/Jenkinsfile-vim-syntax')
  call dein#add('qpkorr/vim-bufkill')
  call dein#add('tomasr/molokai')
  call dein#add('Shougo/echodoc.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-go', {'build': 'make'})
  call dein#add('zeis/vim-kolor')
  call dein#add('nightsense/wonka')
  call dein#add('jiangmiao/auto-pairs.git')
  call dein#add('sebdah/vim-delve')
  call dein#add('hashivim/vim-terraform')
  call dein#add('stephpy/vim-yaml')
  call dein#add('w0rp/ale')

  "call dein#add('autozimu/LanguageClient-neovim', {
    "\ 'rev': 'next',
    "\ 'build': 'bash install.sh',
    "\ })

  " Typescript plugins
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})

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

"colorscheme molokai " Other nice colorschemes to try: molokai, fruity 
colorscheme kolor
let g:kolor_italic=1
let g:kolor_bold=1
let g:kolor_underlined=0
let g:kolor_alternative_matchparen=0
let g:kolor_inverted_matchparen=0

set clipboard=unnamed       " y yy d works with system clipboard
set cursorline              " highlight current line
set relativenumber
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
set mousemodel=popup
set foldmethod=indent
set foldlevel=999
set autoread
set listchars=tab:→\ ,trail:·,eol:↩
set list
set hidden          " Don't autosave buffers
set splitbelow
set splitright
set smartcase       " Do smart case matching
"set virtualedit=all
compiler ruby

" ****************
" Plugin configs *
" ****************

" Airline configuration
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " show tab number
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
let g:airline_powerline_fonts = 1

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

" Echodoc configuration
set noshowmode

" DeoComplete configuration
let g:deoplete#enable_at_startup = 1
"let g:deoplete#async_timeout = 2000
let g:deoplete#auto_complete_delay = 50
set completeopt+=noinsert
set completeopt-=preview
autocmd CompleteDone * silent! pclose!
inoremap <silent><CR> <C-R>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    if (pumvisible())
        return deoplete#close_popup()
    else
        return "\<CR>"
    endif
endfunction

let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'

" Nvim-typescript configuration
let g:nvim_typescript#default_mappings = 1

" Neosnippet configuration
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#snippets_directory = vimhome.'/snippets'

" Ale configuration
let g:ale_set_highlights = 0
let g:ale_sign_warning = '⚠️⚠'
let g:ale_sign_error = '❌'
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_format = '[%linter%] %s'

" vim-go configuration
au FileType go set noexpandtab
au FileType go set nowrap
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_auto_sameids = 1
let g:go_info_mode = 'gocode'
let g:go_snippet_engine = "neosnippet"
let g:go_fmt_command = "goimports"
"let g:go_auto_type_info = 1
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gi <Plug>(go-import)
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
au FileType go nmap <Leader>i <Plug>(go-info) 

" Terraform configuration
let g:terraform_fmt_on_save=1
let g:terraform_align=1

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
noremap <M-t> :tabnew<CR>

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
noremap <F5> :setlocal spell! spelllang=en_us<CR>

"" CtrlP buffer
nnoremap <C-i> :CtrlPBuffer<CR>

inoremap <C-s> <ESC>:w<CR>
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>
inoremap <C-l> <ESC>A

"" Misc maps
map <F5> :setlocal spell! spelllang=en_us<CR>
nnoremap Y y$
nnoremap j gj
nnoremap k gk
nnoremap gb `.
nnoremap <C-s> :w<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>
nnoremap <UP> ddkP
nnoremap <Down> ddp
nnoremap <leader>s z=
nnoremap - :BD<CR>
nnoremap <C-_> :q!<CR>
nnoremap <silent> <leader>v :e $MYVIMRC<CR>
nnoremap <silent> <leader>r :source $MYVIMRC<CR>:echo 'Vim configs reloaded!' <CR>
nnoremap <silent><leader>a ggvG$

inoremap <silent><C-Del> <ESC>dea
inoremap <C-a> <ESC>ggvG$
inoremap <silent><C-Del> <ESC>dea

vnoremap <silent><C-s> :sort<CR>

onoremap p i(

"" Set color almost invisible color for Special Characters
highlight NonText         guifg=#383838    guibg=#2e2d2b    gui=none
highlight NonText         ctermfg=237      ctermbg=235      cterm=none
