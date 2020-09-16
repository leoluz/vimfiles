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
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
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
Plug 'majutsushi/tagbar'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'qpkorr/vim-bufkill'
Plug 'Shougo/echodoc.vim'
Plug 'cohama/lexima.vim'
Plug 'sebdah/vim-delve'
Plug 'hashivim/vim-terraform'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" fzf-preview requires ripgrep for grep search:
"   brew install ripgrep
Plug 'yuki-ycino/fzf-preview.vim'
"
Plug 'tsandall/vim-rego'
Plug 'Chiel92/vim-autoformat'
Plug 'easymotion/vim-easymotion'
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

"colorscheme onedark
"colorscheme palenight
"colorscheme kolor
"colorscheme molokai
"colorscheme Apprentice
colorscheme one
set background=dark

" customize the Search highlight for One colorscheme
" so it looks like kolor in sameid search
call one#highlight('Search', 'ff8901', 'none', 'bold')
highlight Normal guibg=NONE ctermbg=NONE
set mouse=a
set updatetime=100          " usefull to update gitgutter faster
set signcolumn=yes          " always show the gutter
set nowrap
set clipboard=unnamed       " y yy d works with system clipboard
set cursorline              " highlight current line
set relativenumber
set number
let mapleader=" "
set nohlsearch
set laststatus=2
"set cmdheight=2
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

" Nvim-typescript configuration
let g:nvim_typescript#default_mappings = 1

" fzf-preview configuration
nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]
nnoremap <silent> [fzf-p]p     :<C-u>FzfPreviewProjectFiles<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>FzfPreviewGitStatus<CR>
nnoremap <silent> [fzf-p]b     :<C-u>FzfPreviewBuffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>FzfPreviewAllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>FzfPreviewFromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>FzfPreviewChanges<CR>
nnoremap          [fzf-p]gr    :<C-u>FzfPreviewProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]q     :<C-u>FzfPreviewQuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>FzfPreviewLocationList<CR>
let g:fzf_preview_use_dev_icons = 1
"let g:fzf_preview_lines_command = 'bat --color=always --style=grid --theme=one --plain'
"let g:fzf_preview_command = 'bat --color=always --theme=solarized --style=grid {-1}'
let g:fzf_preview_command = 'bat --color=always --theme=base16 --style=grid {-1}'

" vim-go configuration
let g:go_implements_mode = 'gopls'
let g:go_rename_command = 'gopls'
"let g:go_imports_autosave = 0 "run goimports on save
"let g:go_mod_fmt_autosave = 1 "run go_fmt on save
let g:go_fmt_command = "goimports"
let g:go_imports_mode = "goimports"
"let g:go_fmt_command = "gopls"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
"let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_auto_sameids = 1
let g:go_term_mode = "split"
let g:go_term_enabled = 0
let g:go_term_close_on_exit = 0
augroup go
    autocmd!
    au FileType go set noexpandtab
    au FileType go set nowrap
    au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
    au FileType go nmap <Leader>gs :GoImplements<CR>
    au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
    au FileType go nmap <Leader>gi <Plug>(go-import)
    "au FileType go nmap <Leader>gd <Plug>(go-doc)
    au FileType go nmap <Leader>gd :GoDebugStart getcwd().expand("%")<CR>
    au FileType go nmap <Leader>rn <Plug>(go-rename)
    au FileType go nmap <Leader>gc <Plug>(go-callers)
    au FileType go nmap <Leader>e <Plug>(go-def-pop)
    au FileType go nmap <leader>b <Plug>(go-build)
    au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
    au FileType go nmap <leader>t <Plug>(go-test)
    "au FileType go nmap <leader>x <Plug>(go-run)
    au FileType go nmap <leader>x :split term://go run %<CR>:startinsert<CR>
    au FileType go nmap <leader>y :split term://go test ./...<CR>:startinsert<CR>
    au FileType go nmap <Leader>i <Plug>(go-info)
augroup END

" Lua Configuration
augroup lua
    autocmd!
    au FileType lua nmap <leader>x :split term://lua %<CR>
augroup END

" Ale configuration
let g:ale_set_signs = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_set_highlights = 0
let g:ale_echo_msg_format = '[%linter%] %s'
let g:airline#extensions#ale#enabled = 1
augroup ale
    autocmd!
    au FileType go nmap <silent> gp :ALEPrevious -wrap -error<CR>
    au FileType go nmap <silent> gn :ALENext -wrap -error<CR>
augroup END
let g:ale_linters = { 'go': ['golint', 'go vet', 'go build', 'gosimple', 'staticcheck', 'gopls'], }
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" CoC configuration
let g:coc_config_home = vimhome
let g:coc_snippet_next = '<tab>'
vmap <TAB> <Plug>(coc-snippets-select)
augroup coc
    autocmd!
    au FileType go nmap <silent> gy <Plug>(coc-type-definition)
    au FileType go nmap <silent> gi <Plug>(coc-implementation)
    au FileType go nmap <silent> gr <Plug>(coc-references)
    "au FileType go nmap <leader>rn <Plug>(coc-rename)
    au FileType go nmap <leader>re <Plug>(coc-refactor)
    au FileType go nnoremap <silent> U :call <SID>show_documentation()<CR>
    au FileType go nnoremap <leader>b :<Plug>(coc-fix-current)<CR>
    au FileType go nnoremap <leader>o :<C-u>CocList outline<CR>
augroup END
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            "\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <TAB>
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


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
let g:gitgutter_highlight_linenrs = 1
highlight default link GitGutterAddLineNr          DiffAdd
highlight default link GitGutterChangeLineNr       DiffChange
highlight default link GitGutterDeleteLineNr       DiffDelete
highlight default link GitGutterChangeDeleteLineNr DiffChange

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

"" Maps for tabs specific funcionalities
nnoremap L :tabnext<CR>
nnoremap H :tabprevious<CR>
noremap <M-t> :tabnew<CR>

"" Omni completion maps
"inoremap <C-Space> <C-x><C-o>
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

"" Format JSON
nnoremap <silent><leader>gj :%!python -m json.tool<CR>

"" CtrlP buffer
nnoremap <C-i> :CtrlPBuffer<CR>

" Diff mode colorscheme toggle
" The two buffers to be diffed must be in vsplit
function! s:ToggleDiffMode()
    if exists('g:colors_name')
        if g:colors_name == 'kolor'
            syntax off
            colorscheme Apprentice
            windo diffthis
        else
            syntax on
            colorscheme kolor
            windo diffoff
        endif
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
nnoremap <C-l> :bnext<CR>:call SyncTree()<CR>
nnoremap <C-h> :bprevious<CR>:call SyncTree()<CR>
"nnoremap - :BD<CR>
nnoremap <BS> :BD<CR>
nnoremap <C-_> :q!<CR>
nnoremap <silent> <leader>v :e $MYVIMRC<CR>
nnoremap <silent> <leader>z :e $HOME/.zshrc<CR>
nnoremap <silent> <leader>r :source $MYVIMRC<CR>:echo 'Vim configs reloaded!' <CR>
nnoremap <silent> <C-x> :split term://zsh<CR>
nnoremap <silent><leader>a ggvG$
" will indent the whole pasted text
nnoremap <silent><leader>. >']
nnoremap <silent><leader>, <']

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
