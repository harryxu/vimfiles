hi clear

set background=dark

hi Normal           guifg=#F8F8F8 guibg=#141414 gui=none
hi Comment          guifg=#5F5A60
hi CursorLine                     guibg=#1B1B1B
hi CursorColumn                   guibg=#1B1B1B
hi ColorColumn                    guibg=#1B1B1B
hi LineNr           guifg=#AAAAAA guibg=#1B1B1B
hi NonText          guifg=#BCBCBC gui=none
hi Cursor           guifg=#000000 guibg=#A7A7A7

hi Keyword          guifg=#CDA869 gui=none
hi String           guifg=#8F9D6A gui=none

hi Constant         guifg=#cf6b4c gui=none
hi String           guifg=#8f9d6a gui=none
hi htmlTagName      guifg=#9b703f gui=none
hi Identifier       guifg=#9b703f gui=none
hi Statement        guifg=#cda869 gui=none
hi PreProc          guifg=#ff80ff gui=none
hi Type             guifg=#F9EE98 gui=none
hi Function         guifg=#dad085 gui=none
hi Repeat           guifg=#CDA869 gui=none
hi Operator         guifg=#f8f8f8 gui=none

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


