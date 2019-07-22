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
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoUpdateBinaries', 'for': 'go' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-cucumber'
Plug 'leoluz/xmledit'
Plug 'kien/ctrlp.vim'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tfnico/vim-gradle'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'qpkorr/vim-bufkill'
Plug 'Shougo/echodoc.vim'
"Plug 'Shougo/deoplete.nvim'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'deoplete-plugins/deoplete-go', {'do': 'make'}
Plug 'cohama/lexima.vim'
Plug 'sebdah/vim-delve'
Plug 'hashivim/vim-terraform'
Plug 'stephpy/vim-yaml'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Themes
Plug 'tomasr/molokai'
Plug 'zeis/vim-kolor'
Plug 'nightsense/wonka'

Plug 'tsandall/vim-rego'
Plug 'Chiel92/vim-autoformat'

" Initialize plugin system
call plug#end()

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
set cmdheight=2
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

" Set working directory to the current file
autocmd BufEnter * silent! lcd %:p:h

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
let g:NERDTreeQuitOnOpen=1

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
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#async_timeout = 2000
"let g:deoplete#auto_complete_delay = 50
"let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode_visualfc'
"set completeopt+=noinsert
"set completeopt-=preview
"autocmd CompleteDone * silent! pclose!
"inoremap <silent><CR> <C-R>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
    "if (pumvisible())
        "return deoplete#close_popup()
    "else
        "return "\<CR>"
    "endif
"endfunction

" configure deoplete to work with omnifunction for go
"call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" Nvim-typescript configuration
let g:nvim_typescript#default_mappings = 1

" Neosnippet configuration
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#snippets_directory = vimhome.'/snippets'

" Ale configuration
let g:ale_set_highlights = 0
let g:ale_sign_warning = '⚠️'
let g:ale_sign_error = '❌'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:airline#extensions#ale#enabled = 1

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
let g:go_snippet_engine = "neosnippet"
let g:go_fmt_command = "goimports"
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
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <leader>x <Plug>(go-run)
au FileType go nmap <Leader>i <Plug>(go-info) 

" CoC configuration
au FileType go nmap <silent> gp <Plug>(coc-diagnostic-prev)
au FileType go nmap <silent> gn <Plug>(coc-diagnostic-next)
au FileType go nmap <silent> gy <Plug>(coc-type-definition)
au FileType go nmap <silent> gi <Plug>(coc-implementation)
au FileType go nmap <silent> gr <Plug>(coc-references)
au FileType go nnoremap <silent> U :call <SID>show_documentation()<CR>
au FileType go nnoremap <leader>rr <Plug>(coc-rename)
au FileType go nmap <leader>b :<Plug>(coc-fix-current)<CR>
au FileType go nnoremap <leader>o :<C-u>CocList outline<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"let g:airline#extensions#coc#enabled = 1
"let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
"let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" Delve configuration
au FileType go nnoremap <F8> :DlvTest<CR>
au FileType go nnoremap <F9> :DlvToggleBreakpoint<CR>
au FileType go nnoremap <F10> :DlvClearAll<CR>

" Terraform configuration
let g:terraform_fmt_on_save=1
let g:terraform_align=1

" Rego configuration
let g:formatdef_rego = '"opa fmt"'
let g:formatters_rego = ['rego']
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
au BufWritePre *.rego Autoformat

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
"inoremap <C-j> <C-n>
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
nnoremap <silent><leader>q :NERDTreeToggle<CR>
nnoremap <silent><leader>n :NERDTreeFind<CR>

"" Format JSON
nnoremap <silent><leader>fj :%!python -m json.tool<CR>

"" CtrlP buffer
nnoremap <C-i> :CtrlPBuffer<CR>

" Diff mode colorscheme toggle
function! s:ToggleDiffMode()
    if exists('g:colors_name')
        if g:colors_name == 'kolor'
            syntax off
            colorscheme github
        else
            syntax on
            colorscheme kolor
        endif
    endif
endfunction
map <silent> <F6> :call <SID>ToggleDiffMode()<CR>


inoremap <C-s> <ESC>:w<CR>
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>
inoremap <C-l> <ESC>A

"" Misc maps
map <F4> :setlocal spell! spelllang=en_us<CR>
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
nnoremap <silent> <leader>z :e $HOME/.zshrc<CR>
nnoremap <silent> <leader>r :source $MYVIMRC<CR>:echo 'Vim configs reloaded!' <CR>
nnoremap <silent><leader>a ggvG$

inoremap <silent><C-Del> <ESC>dea
inoremap <C-a> <ESC>ggvG$
inoremap <silent><C-Del> <ESC>dea

vnoremap <silent><C-s> :sort<CR>

onoremap p i(

"Makes help opening vertically
cnoreabbrev H vert h

"" Set color almost invisible color for Special Characters
highlight NonText         guifg=#383838    guibg=#2e2d2b    gui=none
highlight NonText         ctermfg=237      ctermbg=235      cterm=none
