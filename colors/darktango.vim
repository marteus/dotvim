" Vim color file
" Name: DarkTango
" Maintainer: Panos Laganakos <panos.laganakos@gmail.com>
" Version: 0.3
" Modifications: Martin Skytte


set background=dark
if version > 580
	" no guarantees for version 5.8 and below, but this makes it stop
	" complaining
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let g:colors_name="darktango"


hi Normal       guifg=#d3d7cf guibg=#2e3436     ctermfg=Grey

" {{{ syntax
hi Comment      guifg=#555753                   ctermfg=DarkGreen
hi Title        guifg=#eeeeec                   ctermfg=White
hi Underlined   guifg=#20b0eF gui=none
hi Statement    guifg=#eeeeec                   ctermfg=DarkCyan
hi Type         guifg=#ce5c00 gui=none                  ctermfg=DarkBlue
hi PreProc      guifg=#204a87                   ctermfg=DarkBlue
hi Constant     guifg=#c4a000                   ctermfg=DarkYellow
hi Identifier   guifg=#3465a4                   ctermfg=Blue        cterm=none
hi Special      guifg=#fcaf3e                   ctermfg=DarkCyan
hi Ignore       guifg=#f57900
hi Todo         guifg=#eeeeec guibg=#ce5c00     ctermfg=DarkGrey    ctermbg=Yellow
hi Error        guifg=#cc0000 guibg=#2e3436
"}}}


" {{{ groups
hi Cursor       guifg=#2e3436 guibg=#babdb6
"hi CursorIM
hi Directory    guifg=#bbd0df
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
hi ErrorMsg     guifg=#eeeeec guibg=#a40000
hi VertSplit    guifg=#2e3436 guibg=#555753 gui=none    ctermfg=Grey ctermbg=Black cterm=none
hi Folded       guifg=#eeeeec guibg=#555753
hi FoldColumn   guifg=#555753 guibg=#2e3436
hi LineNr       guifg=#555753 guibg=#2e3436             ctermfg=DarkGrey
hi MatchParen   guifg=#2e3436 guibg=#888a85
hi ModeMsg      guifg=#ce5c00
hi MoreMsg      guifg=#ce5c00
hi NonText      guifg=#555753 guibg=#2e3436             ctermfg=grey
hi Question     guifg=#aabbcc
hi Search       guifg=#edd400 guibg=#555753
hi IncSearch    guifg=#edd400 guibg=#555753
hi SpecialKey   guifg=#555753                           ctermfg=darkgrey
hi StatusLine   guibg=#555753 guifg=#eeeeec gui=none    ctermfg=Grey ctermbg=DarkGrey cterm=bold
hi StatusLineNC guibg=#555753 guifg=#272334 gui=none    ctermfg=Grey ctermbg=DarkGrey cterm=none
hi Visual       guibg=#fcaf3e guifg=#ce5c00

"hi VisualNOS
hi WarningMsg   guifg=salmon
hi WildMenu     guifg=#d3d7cf guibg=#888a85             ctermfg=Grey ctermbg=DarkGrey cterm=none
hi Menu         guifg=#d3d7cf guibg=#888a85
"hi Scrollbar  guibg=grey30 guifg=tan
"hi Tooltip
hi Pmenu        guibg=#babdb6 guifg=#555753             ctermfg=Grey ctermbg=DarkGrey
hi PmenuSel     guibg=#eeeeec guifg=#2e3436             ctermfg=Blue ctermbg=DarkGrey
hi CursorLine   guibg=#212628 ctermfg=Grey              ctermbg=DarkGrey

hi TabLine      guibg=#555753 gui=none                  ctermbg=DarkGrey cterm=none
hi TabLineFill  guibg=#555753 gui=none                  ctermbg=DarkGrey cterm=none
"hi TabLineSel


hi SpellBad     gui=undercurl guisp=#cc0000
hi SpellCap     gui=undercurl guisp=#3465a4

" }}}

"  {{{ terminal
" TODO
" }}}

"vim: sw=4
