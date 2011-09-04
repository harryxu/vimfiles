" Vim color file
" Maintainer:   Tim Alexeevsky <realtim@mail.ru>
" Last Change:  2002-03-14 
" Version:      0.5
" URL:		    http://sunsite.cs.msu.su/~tim/vim/sand.vim 
" 
" Thanx to Hans Fugal for his colorscheme_template.vim

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="MySand"

highlight Normal guibg=#FFFFCC guifg=NONE
highlight PreProc guibg=NONE guifg=Maroon4
highlight Comment guibg=NONE guifg=SteelBlue4
highlight Constant guibg=NONE guifg=Blue3
highlight Special guibg=NONE guifg=SeaGreen
highlight Identifier guibg=NONE guifg=SeaGreen
highlight Statement guibg=NONE guifg=bisque4
highlight Type guibg=NONE guifg=DarkOliveGreen
highlight Todo guibg=LightYellow3 guifg=Blue4
highlight NonText guibg=NONE guifg=DarkGreen
highlight LineNr guibg=NONE guifg=Brown
highlight StatusLineNC guifg=#8090a0
highlight StatusLine guifg=#005070

"vim: tw=0 sw=3 ts=3 sts=3 et
