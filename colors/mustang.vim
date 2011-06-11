" Maintainer:   Henrique C. Alves (hcarvalhoalves@gmail.com)
" Version:      1.0
" Last Change:  September 25 2008

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "mustang"

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine     guibg=#2d2d2d ctermbg=236 ctermbg=236
  hi CursorColumn   guibg=#2d2d2d ctermbg=236 ctermbg=236
  hi MatchParen     guifg=#d0ffc0 ctermfg=193 guibg=#2f2f2f ctermbg=236 gui=bold ctermfg=157 ctermbg=237 cterm=bold
  hi Pmenu          guifg=#ffffff ctermfg=15 guibg=#444444 ctermbg=238 ctermfg=255 ctermbg=238
  hi PmenuSel       guifg=#000000 ctermfg=0 guibg=#b1d631 ctermbg=149 ctermfg=0 ctermbg=148
endif

hi Search       guifg=#000000 ctermfg=0 guibg=#b1d631 ctermbg=149 ctermfg=0   ctermbg=148

hi DiffAdd      guifg=#ffffff ctermfg=15 guibg=#204a87 ctermbg=24 gui=none
hi DiffDelete   guifg=#ffffff ctermfg=15 guibg=#a40000 ctermbg=124 gui=none
hi DiffChange   guifg=#ffffff ctermfg=15 guibg=#5c3566 ctermbg=239 gui=none
hi DiffText     guifg=#ffffff ctermfg=15 guibg=#a40000 ctermbg=124 gui=none

" General colors
hi Cursor       guifg=NONE    guibg=#626262 ctermbg=241 gui=none ctermbg=241
hi Normal       guifg=#e2e2e5 ctermfg=7 guibg=#202020 ctermbg=234 gui=none ctermfg=253 ctermbg=234
hi NonText      guifg=#808080 ctermfg=244 guibg=#303030 ctermbg=236 gui=none ctermfg=244 ctermbg=235
hi LineNr       guifg=#808080 ctermfg=244 guibg=#000000 ctermbg=0 gui=none ctermfg=244 ctermbg=232
hi StatusLine   guifg=#d3d3d5 ctermfg=188 guibg=#444444 ctermbg=238 gui=italic ctermfg=253 ctermbg=238 cterm=italic
hi StatusLineNC guifg=#939395 ctermfg=246 guibg=#444444 ctermbg=238 gui=none ctermfg=246 ctermbg=238
hi VertSplit    guifg=#444444 ctermfg=238 guibg=#444444 ctermbg=238 gui=none ctermfg=238 ctermbg=238
hi Folded       guibg=#384048 ctermbg=238 guifg=#a0a8b0 ctermfg=248 gui=none ctermbg=4 ctermfg=248
hi Title        guifg=#f6f3e8 ctermfg=7 guibg=NONE    gui=bold ctermfg=254 cterm=bold
hi Visual       guifg=#faf4c6 ctermfg=230 guibg=#3c414c ctermbg=238 gui=none ctermfg=254 ctermbg=4
hi SpecialKey   guifg=#808080 ctermfg=244 guibg=#343434 ctermbg=236 gui=none ctermfg=244 ctermbg=236

" Syntax highlighting
hi Comment      guifg=#808080 ctermfg=244 gui=italic ctermfg=244
hi Todo         guifg=#8f8f8f ctermfg=245 gui=italic ctermfg=245
hi Boolean      guifg=#b1d631 ctermfg=149 gui=none ctermfg=148
hi String       guifg=#b1d631 ctermfg=149 gui=italic ctermfg=148
hi Identifier   guifg=#b1d631 ctermfg=149 gui=none ctermfg=148
hi Function     guifg=#ffffff ctermfg=15 gui=bold ctermfg=255
hi Type         guifg=#7e8aa2 ctermfg=103 gui=none ctermfg=103
hi Statement    guifg=#7e8aa2 ctermfg=103 gui=none ctermfg=103
hi Keyword      guifg=#ff9800 ctermfg=208 gui=none ctermfg=208
hi Constant     guifg=#ff9800 ctermfg=208 gui=none  ctermfg=208
hi Number       guifg=#ff9800 ctermfg=208 gui=none ctermfg=208
hi Special      guifg=#ff9800 ctermfg=208 gui=none ctermfg=208
hi PreProc      guifg=#faf4c6 ctermfg=230 gui=none ctermfg=230
hi Todo         guifg=#000000 ctermfg=0 guibg=#b1d631 ctermbg=149 gui=italic

" Code-specific colors
hi pythonOperator guifg=#7e8aa2 ctermfg=103 gui=none ctermfg=103

