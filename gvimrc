" marteus' vimrc

set bg=light
colo solarized
hi clear SignColumn
hi link SignColumn LineNr

if has('mac')
	set guifont=Ubuntu\ Mono\ derivative\ Powerline:h14,Monaco:h12
else 
	set guifont=Monospace\ 10
endif

" set menu (m), gui tabs (e), 
set guioptions=em

" highlight Normal guibg=black guifg=white
"highlight Folded guibg=black
"set guifont=Terminus\ 12
"set guifont=Terminus
"set guifont=Monaco\ 10

