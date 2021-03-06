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

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/playground'
Plug 'leoluz/dev2one.nvim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-cucumber'
Plug 'leoluz/xmledit'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tfnico/vim-gradle'
Plug 'majutsushi/tagbar'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'qpkorr/vim-bufkill'
Plug 'Shougo/echodoc.vim'
Plug 'cohama/lexima.vim' " auto close stuff
Plug 'sebdah/vim-delve'
Plug 'hashivim/vim-terraform'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" fzf Ag requires ripgrep for grep search:
"   brew install ripgrep
Plug 'junegunn/fzf.vim'
"
Plug 'tsandall/vim-rego'
Plug 'easymotion/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" vim-devicons requires nerd-fonts:
"   brew tap homebrew/cask-fonts
"   brew cask install font-hack-nerd-font
Plug 'ryanoasis/vim-devicons'

"Themes
Plug 'rakr/vim-one'
Plug 'tomasr/molokai'
Plug 'zeis/vim-kolor'
Plug 'romainl/Apprentice'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'joshdick/onedark.vim'
Plug 'cormacrelf/vim-colors-github'

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
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" Palenight theme config
let g:palenight_terminal_italics=1

" One theme config
let g:one_allow_italics=1

" Kolor config
let g:kolor_italic=1
let g:kolor_bold=1
let g:kolor_underlined=0
let g:kolor_alternative_matchparen=1
let g:kolor_inverted_matchparen=1

colorscheme one
set background=dark

" customize the Search highlight for One colorscheme
" so it looks like kolor in sameid search
call one#highlight('Search', 'ff8901', 'none', 'bold')
highlight Normal guibg=NONE ctermbg=NONE
set mouse=a
set updatetime=100          " usefull to update gitgutter faster
set signcolumn="yes:3"          " always show the gutter
set nowrap
set clipboard=unnamed       " y yy d works with system clipboard
set cursorline              " highlight current line
set relativenumber
set number
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
set encoding=UTF-8
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
"set wmh=0           " set winminheight to 0
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
set completeopt=menuone,noinsert,noselect
compiler ruby

augroup yaml
    autocmd!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab cursorcolumn
augroup END

augroup term
    autocmd!
    au TermOpen * setlocal listchars= nonumber norelativenumber signcolumn=no
    au TermOpen * startinsert
    au BufEnter,BufWinEnter,WinEnter term://* startinsert
    au BufLeave term://* stopinsert
augroup END

" ****************
" Plugin configs *
" ****************

" Airline configuration
"let g:airline_theme='deus'
"let g:airline_theme='minimalist'
"let g:airline_theme='distinguished'
let g:airline_theme='palenight'

let g:airline#extensions#nvimlsp#enabled = 1
let airline#extensions#nvimlsp#error_symbol = 'E:'
let airline#extensions#nvimlsp#warning_symbol = 'W:'
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
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeAutoCenter = 1
let g:NERDTreeAutoDeleteBuffer = 1
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
augroup nerdtree
    autocmd!
    autocmd BufRead * call SyncTree()
augroup END
nnoremap <silent><leader>q :NERDTreeToggle<CR><C-w>l:call SyncTree()<CR><C-w>h
nnoremap <silent><leader>n :NERDTreeFind<CR>

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

" Nvim-typescript configuration
let g:nvim_typescript#default_mappings = 1

" fzf.vim configuration
nnoremap <leader>f :Rg<CR>
nnoremap <leader>ht :Helptags<CR>
nnoremap <C-p> :Files<CR>

" Lua Configuration
augroup lua
    autocmd!
    au FileType lua setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup END

" Go Configuration
augroup golang
    autocmd!
    au FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
augroup END

" Delve configuration (debug)
augroup delve
    autocmd!
    au FileType go nnoremap <F8> :DlvTest<CR>
    au FileType go nnoremap <F9> :DlvToggleBreakpoint<CR>
    au FileType go nnoremap <F10> :DlvClearAll<CR>
augroup END

" Terraform configuration
let g:terraform_fmt_on_save=1
let g:terraform_align=1

" Rego configuration
let g:formatdef_rego = '"opa fmt"'
let g:formatters_rego = ['rego']
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
augroup rego
    autocmd!
    au BufWritePre *.rego Autoformat
augroup END

" Easymotion configuration
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap <Leader>s <Plug>(easymotion-overwin-f)

" Gitgutter configuration
"let g:gitgutter_signs = 0
let g:gitgutter_sign_priority = 1
let g:gitgutter_highlight_linenrs = 1
highlight default link GitGutterAddLineNr          DiffAdd
highlight default link GitGutterChangeLineNr       DiffChange
highlight default link GitGutterDeleteLineNr       DiffDelete
highlight default link GitGutterChangeDeleteLineNr DiffChange

" UltiSnips configuration
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', 'UltiSnips']


" Compe configuration
inoremap <silent><expr> <CR> compe#confirm(lexima#expand('<LT>CR>', 'i'))

" Completion-nvim configuration
"autocmd BufEnter * lua require'completion'.on_attach()
"let g:completion_matching_ignore_case = 1
"let g:completion_auto_change_source = 1
"let g:completion_enable_snippet = 'UltiSnips'
"let g:completion_matching_strategy_list = ['exact', 'fuzzy']
"let g:completion_chain_complete_list = [
"    \{'complete_items': ['lsp', 'snippet']},
"    \{'complete_items': ['buffers', 'ts']},
"    \{'mode': '<c-p>'},
"    \{'mode': '<c-n>'}
"\]
"let g:completion_confirm_key = "" "don't mess up with auto-close plugings
"imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
"                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

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
nnoremap <leader>- 5<C-W>-
nnoremap <leader>+ 5<C-W>+
nnoremap <leader>. 10<C-W>>
nnoremap <leader>, 10<C-W><
"close quickfix window
nnoremap <leader>x :ccl<CR>

"" Maps for tabs specific funcionalities
nnoremap L :tabnext<CR>
nnoremap H :tabprevious<CR>
noremap <M-t> :tabnew<CR>

"" Omni completion maps
inoremap <silent><expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <silent><expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"

"" NerdCommenter maps
nmap <silent><leader>/ <plug>NERDCommenterToggle
vmap <leader>/ <plug>NERDCommenterToggle

"" Tagbar maps
nnoremap <leader>w :TagbarToggle<CR>

"" Format JSON
nnoremap <silent><leader>gj :%!python -m json.tool<CR>

function! s:ToggleDiffMode()
    if &diff
        syntax on
        windo diffoff
    else
        syntax off
        windo diffthis
    endif
endfunction
map <silent> <leader>d :call <SID>ToggleDiffMode()<CR>

inoremap <C-s> <ESC>:w<CR>
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
nnoremap <BS> :BD<CR>
nnoremap <C-_> :q!<CR>
nnoremap <silent> <leader>v :e $MYVIMRC<CR>
nnoremap <silent> <leader>z :e $HOME/.zshrc<CR>
nnoremap <silent> <leader>r :source $MYVIMRC<CR>:echo 'Vim configs reloaded!' <CR>
nnoremap <silent> <C-x> :split term://zsh<CR>
nnoremap <silent><leader>a ggVG$

inoremap <silent><C-Del> <ESC>dea
inoremap <C-a> <ESC>ggvG$
inoremap <silent><C-Del> <ESC>dea

vnoremap <silent><C-s> :sort<CR>

onoremap p i(

"Makes help opening vertically
cnoreabbrev H vert h

"Disable F1 help map because of the crappy apple touch bar :/
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

"Terminal mappings
tnoremap <C-n> <C-\><C-n>

" load Lua modules
lua require('leoluz.configs')
lua require('dev2one')
nmap <silent> <leader>t :GoTestNear<CR>

augroup lsp
  autocmd!
  autocmd BufWritePre * lua require'leoluz.configs'.auto_format_lsp()
augroup END

sign define LspDiagnosticsSignError text=✖ texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text=⚠ texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text=I texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text=H texthl=LspDiagnosticsSignHint linehl= numhl=
highlight LspDiagnosticsFloatingError guifg=#E74C3C
highlight LspDiagnosticsSignError guifg=#E74C3C
