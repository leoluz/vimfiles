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
    set guifont=Menlo:h18
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

if has("gui_running")
    colorscheme candycode       " other nice colorschemes to try: molokai, fruity
    set cursorline              " highlight current line
    set cm=blowfish             " crypt method
    let &rtp = &rtp . "," . vimhome . "/bundle/vundle"
    call vundle#rc()
else
    syntax off
end

" ****************
" Bundle Section *
" ****************

if has("gui_running")
    Bundle 'gmarik/vundle.git'
    Bundle 'vim-scripts/AutoComplPop.git'
    Bundle 'tpope/vim-rails.git'
    Bundle 'msanders/snipmate.vim.git'
    Bundle 'scrooloose/nerdtree.git'
    Bundle 'scrooloose/nerdcommenter.git'
    Bundle 'tpope/vim-markdown.git'
    Bundle 'tpope/vim-surround.git'
    Bundle 'tpope/vim-repeat.git'
    Bundle 'vim-ruby/vim-ruby.git'
    Bundle 'tpope/vim-cucumber.git'
    Bundle 'leoluz/xmledit.git'
    Bundle 'leoluz/snipmate-snippets.git'
    Bundle 'kien/ctrlp.vim.git'
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

" *********************
" Status line section *
" *********************

set statusline=%t\              "tail of the filename
set statusline+=%y              "filetype

"display a warning if file encoding isn't utf-8
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%r              "read only flag
set statusline+=%m              "modified flag

set statusline+=%=              "left/right separator
set statusline+=col:%c\         "cursor column
set statusline+=line:%l/%L\     "cursor line
set statusline+=%P              "percent through file
set laststatus=2

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning = '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction

" ****************
" Config section *
" ****************

if has("autocmd")
    au BufRead,BufNewFile *.js set ft=javascript.jquery
    autocmd User Rails.view.* set ft+=.html
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType java set omnifunc=javacomplete#Complete
    autocmd FileType ruby set omnifunc=rubycomplete#Complete
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c set omnifunc=ccomplete#Complete
    autocmd GUIEnter * set lines=40 columns=150
endif

" AutoComplPop configuration
let g:acp_behaviorKeywordLength = 4
let g:acp_enableAtStartup = 1
let g:acp_completeoptPreview = 1

" NERDTree configuration
let g:NERDTreeShowBookmarks=1

" CtrlP configuration
let g:ctrlp_root_markers = ['pom.xml', 'src']
let g:ctrlp_open_multi = '1'
let g:ctrlp_arg_map = 1

" Snipmate configuration
let g:snippets_dir=vimhome."/bundle/snipmate-snippets"
let g:snips_author="Leonardo Luz"

let mapleader=" "
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

nnoremap y "+y
nnoremap p "+p
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <silent><C-Left> <C-T>
map <silent><C-Right> <C-]>
imap <C-s> <ESC>:w<CR>
nmap <C-s> :w<CR>
vnoremap y "+y
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

nnoremap <silent><leader>q :NERDTreeToggle<CR>
nnoremap <silent><leader>s :set spell spelllang=pt<CR>
exec "nmap <leader>r :source ~/".cfgfile." <CR>:echo 'Refresh!' <CR>"

nnoremap - :q<CR>
nnoremap <C-_> :q!<CR>

map <silent><leader>c <plug>NERDCommenterToggle
map <silent><leader>x <plug>NERDCommenterSexy
map <silent><leader>z <plug>NERDCommenterMinimal
