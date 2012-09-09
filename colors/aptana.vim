hi clear

set background=dark

hi Normal           guifg=#F8F8F8 guibg=#141414 gui=none
hi Comment          guifg=#5F5A60
hi CursorLine                     guibg=#1B1B1B
hi CursorColumn                   guibg=#1B1B1B
hi ColorColumn                    guibg=#1B1B1B
hi LineNr           guifg=#AAAAAA guibg=#1B1B1B
hi NonText          guifg=#3F3F3F gui=none
hi Cursor           guifg=#000000 guibg=#A7A7A7

hi Pmenu            guifg=#FF6600 guibg=#000000 ctermfg=1 ctermbg=4
hi PmenuSel         guifg=#FFFFFF guibg=#990000
hi PmenuSbar        guibg=#707070 guifg=fg gui=NONE
hi PmenuThumb       guibg=#D0D0D0 guifg=bg gui=NONE

hi Visual           guibg=#01005F ctermbg=60 gui=NONE

hi Keyword          guifg=#CDA869 gui=none
hi Constant         guifg=#CF6B4C gui=none
hi String           guifg=#8F9D6A gui=none
hi Identifier       guifg=#7587A6 gui=none
hi Statement        guifg=#CDA869 gui=none
hi PreProc          guifg=#DAD085 gui=none
hi Type             guifg=#C5AF75 gui=none
hi Function         guifg=#DAD085 gui=none
hi Repeat           guifg=#CDA869 gui=none
hi Operator         guifg=#EEEEEE gui=none
hi Special          guifg=#EEEEEE gui=none

hi link character       constant
hi link number          constant
hi link boolean         constant
hi link Float           Number
hi link Conditional     Repeat
hi link Label           Statement
hi link Keyword         Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link htmlTag         Special
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special

" php
hi phpVarSelector       guifg=#7587A6
hi phpQuoteSingle       guifg=#8F9D6A
hi phpDefineFuncName    guifg=#9B703F
hi phpRegionDelimiter   guifg=#666666
hi link phpMemberHere   Identifier
hi link phpQuoteDouble  String

" xml html
hi xmlTag               guifg=#9B703F ctermfg=179 gui=NONE
hi xmlTagName           guifg=#9B703F ctermfg=179 gui=NONE
hi xmlEndTag            guifg=#9B703F ctermfg=179 gui=NONE
hi link htmlTag         xmlTag
hi link htmlTagName     xmlTagName
hi link htmlEndTag      xmlEndTag
hi link htmlArg         xmlTag

" CSS
hi link cssTagName      xmlTagName
hi link cssClassName    String
hi link cssIdentifier   Identifier
