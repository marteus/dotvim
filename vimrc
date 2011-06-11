" marteus' vimrc

set nocompatible

filetype off     " disable filetype for pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

set backspace=indent,eol,start       " allow backspacing over everything in insert mode

" set bg=dark
"highlight Normal guibg=black guifg=white
"highlight Folded guibg=black
"set guifont=Terminus
set guifont=Monaco\ 10

colo mustang

let mapleader=","           " change mapleader from \ to ,

set wildmenu
set wildmode=longest,full
set wildignore+=*.o,*.a,*.so,*.bak,*.class,.git

set tabstop=4 softtabstop=4 shiftwidth=4
set noexpandtab " tabs is tabs, not spaces :p
set smarttab
set autoindent copyindent preserveindent

"set smarttab " use tabs at the start of a line, spaces elsewhere
" use bare bone terminal like gui
set guioptions=

set number " turn on line numbering
set list
set listchars=tab:»·,nbsp:%,trail:·,extends:>,precedes:< " what to show when I hit :set list
set noerrorbells " no damn pc beeps


" i'll be using SCons for c/c++ programming :)
" set makeprg=scons\ -Q\ -j3

" set backup		" keep a backup file
" set backupdir=~/.vim/vimfiles/backup " backup files 
" set directory=~/.vim/vimfiles/temp " dir for temp files

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set ignorecase  " case insensitive searching
set smartcase

set wrap
set linebreak
set showbreak=..
" enable j and k movement on wrapped text
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Easy window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Don't use Ex mode, use Q for formatting
map Q gq

syntax on
set hlsearch

" shortcuts for sourcing the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


" Put these in an autocmd group, so that we can delete them easily.
"augroup vimrcEx
"au!


" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

autocmd FileType python set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd FileType python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd FileType python nmap <F5> :!python %<cr> 

autocmd BufNewFile,BufRead SCons* set filetype=scons
autocmd BufNewFile,BufRead *.module set filetype=php

autocmd BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl

autocmd Filetype cpp nmap \check :!g++ -fsyntax-only % <CR>
autocmd Filetype c nmap \check :!gcc -fsyntax-only % <CR>
autocmd Filetype php nmap \check :!php --syntax-check % <CR>
autocmd Filetype php set makeprg=php\ -l\ %
                       \ errorformat=%m\ in\ %f\ on\ line\ %l
autocmd FileType php set ts=2 sw=2

autocmd FileType scala set ts=2 sw=2 et


autocmd FileType haskell set expandtab
autocmd FileType haskell compiler ghc

autocmd FileType tex set textwidth=0 nolist spell spelllang=en_us
autocmd FileType text setlocal nolist


let g:haddock_browser="/usr/bin/firefox"
let g:haddock_docdir="/usr/share/doc/ghc"

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


"augroup END

" key mappings
"
" set up std_c.vim syntax highlighting
let c_cpp_comments = 1
let c_no_names = 1
let c_C99 = 1


" F8 : toggle taglist explorer
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Sort_Type = "name"
let Tlist_Display_Prototype = 0
nnoremap <silent> <F8> :TlistToggle<CR>

let tlist_php_settings = 'php;c:class;f:function'

let treeExplVertical = 1
let treeExplWinSize = 30
let treeExplHidden = 1
let treeExplHidePattern = "\.class\|\.o"


set tags+=/usr/include/tags
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

" Set 300 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime  = 300
let g:SrcExpl_winHeight     = 9
" Let the Source Explorer update the tags file when opening
let g:SrcExpl_updateTags  = 1
let g:SrcExpl_refreshKey   = "<Space>"
let g:SrcExpl_gobackKey    = "<C-b>"
" The switch of the Source Explorer
nmap <M-F8> :SrcExplToggle<CR> 

" MiniBufExplorer settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1



" Custom highlighting
hi scalaOperator gui=bold guifg=#cc0000

