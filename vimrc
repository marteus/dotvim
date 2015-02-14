" marteus' vimrc

set nocompatible

filetype off     " disable filetype for pathogen
call pathogen#infect()
filetype plugin indent on

set backspace=indent,eol,start       " allow backspacing over everything in insert mode

" set bg=dark
"highlight Normal guibg=black guifg=white
"highlight Folded guibg=black

" Fix bad default background for SignColumn
highlight SignColumn ctermbg=NONE guibg=NONE
colo mustang

let mapleader=","           " change mapleader from \ to ,

set wildmenu
set wildmode=longest:list
set wildignore+=*.o,*.a,*.so,*.bak,*.class,.git

set tabstop=4 softtabstop=4 shiftwidth=4
set noexpandtab " tabs is tabs, not spaces :p
set smarttab
set copyindent preserveindent
set autoindent
set cinoptions=(0,u0,U0,W4,m1

set number " turn on line numbering
" set list
set listchars=tab:»·,nbsp:%,trail:·,extends:>,precedes:< " what to show when I hit :set list
set noerrorbells " no damn pc beeps

" always show status line
set laststatus=2

" window settings
set noequalalways
set splitright

" set backup		" keep a backup file
" set backupdir=~/.vim/vimfiles/backup " backup files 
" set directory=~/.vim/vimfiles/temp " dir for temp files

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set ignorecase  " case insensitive searching

set wrap
set linebreak
set showbreak=..
" enable j and k movement on wrapped text
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" map shift k to split current line (opposite to J for join lines)
nnoremap K i<CR><Esc>

" moving aroung in command mode
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>

" DK layout on mac cannot do C-] (and it is awkward anyway)
nnoremap <C-CR> <C-]> 
nnoremap æ :
vnoremap æ :

" Fast shortcut to leave insert mode instead of C-c or Esc
inoremap jk <Esc>

nmap <Leader>/ :nohlsearch<CR>
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

autocmd Filetype c   set tags+=/usr/include/tags
autocmd Filetype cpp set tags+=/usr/include/tags
autocmd FileType php set ts=2 sw=2

autocmd FileType scala set ts=2 sw=2 et


autocmd FileType haskell set expandtab
autocmd FileType haskell compiler ghc

autocmd FileType tex set textwidth=0 nolist spell spelllang=en_us
autocmd FileType text setlocal nolist

autocmd FileType cs,c,cpp set commentstring=//\ %s

" Show syntax highlighting groups for word under cursor
nmap <C-S-h> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

let g:Tex_DefaultTargetFormat='pdf'

"augroup END

" key mappings
"
" set up std_c.vim syntax highlighting
let c_cpp_comments = 1
let c_no_names = 1
let c_C99 = 1

function! FoldText()
	let indent_level = indent(v:foldstart)
	let indent = repeat(' ', indent_level)
	let left_trimmed_text = substitute(getline(v:foldstart), '^\s*', '', '')
	let foldsize = v:foldend - v:foldstart
	return indent . left_trimmed_text . ' (' . foldsize. ' lines)'
endfunction

set foldtext=FoldText()
" OmniSharp won't work without this setting
filetype plugin on

"This is the default value, setting it isn't actually necessary
let g:OmniSharp_host = "http://localhost:2000"

"Set the type lookup function to use the preview window instead of the status line
"let g:OmniSharp_typeLookupInPreview = 1

"Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 1

"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
" set noshowmatch

"don't autoselect first item in omnicomplete, show if only one item (for preview)
"remove preview if you don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview
" Fetch full documentation during omnicomplete requests. 
" There is a performance penalty with this (especially on Mono)
" By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
" you need it with the :OmniSharpDocumentation command.
" let g:omnicomplete_fetch_documentation=1

"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin
set splitbelow

" Get Code Issues and syntax errors
let g:syntastic_cs_checkers = ['syntax', 'semantic'] " ['syntax', 'semantic', 'issues']
" let g:syntastic_disabled_filetypes = ['cs']

augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    " autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    " makes TextChanged dd incredible slow :(
    "autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
"    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    "finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue 
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>  
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-j> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <C-k> :OmniSharpNavigateDown<cr>

augroup END


" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2

" Contextual code actions (requires CtrlP)
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

" rename with dialog
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>      
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap <leader>tp :OmniSharpAddToProject<cr>

" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>

" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>
"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden

let g:airline_powerline_fonts = 1

let g:ophigh_highlight_link_group="Special"

let g:ycm_error_symbol = ">>"
let g:ycm_warning_symbol = "*"

let g:tcommentOptions = {'col': 1}
