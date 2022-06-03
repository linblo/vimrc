" Vim color file
" 84
" Created by  with ThemeCreator (https://github.com/mswift42/themecreator)

hi clear

if exists("syntax on")
syntax reset
endif

set t_Co=256
let g:colors_name = "84"


" Define reusable colorvariables.
let s:bg="#0d0f31"
let s:fg="#96A1FF"
let s:fg2="#3B4D66"
let s:fg3="#FF16B0"
let s:fg4="#F1F1F1"
let s:bg2="#070825"
let s:bg3="#525863"
let s:bg4="#1e2133"
let s:keyword="#FF16B0"
let s:builtin="#46BDFF"
let s:const= "#96A1FF"
let s:comment="#525863"
let s:func="#fcfcfc"
let s:str="#96A1FF"
let s:type="#46BDFF"
let s:var="#DF81FC"
let s:warning="#ff0000"
let s:warning2="#ff8800"
let s:lineNo="#3B4D66"
let s:added="#46BDFF"
let s:modified="#fcee54"
let s:deleted="#FF16B0"
let s:untracked="#B3F361"
let s:ignored="#D5D8DA59"
let s:cur="#b3f361"

exe 'hi Normal guifg='s:fg ' guibg='s:bg
exe 'hi Visual guibg='s:fg2
exe 'hi Cursor guifg='s:bg ' guibg='s:cur
exe 'hi CursorLine  guibg='s:bg2
exe 'hi CursorLineNr guifg='s:fg ' guibg='s:bg2
exe 'hi CursorColumn  guibg='s:bg3
exe 'hi ColorColumn  guibg='s:bg2
exe 'hi LineNr guifg='s:fg2' guibg='s:bg2
exe 'hi VertSplit guibg='s:fg4' guifg='s:bg
exe 'hi FloatBorder guifg='s:fg4' guibg='s:bg2
exe 'hi MatchParen guifg=white guibg='s:fg3' guifg='s:bg
exe 'hi StatusLine guifg='s:fg2 ' guibg='s:bg2' gui=bold'
exe 'hi Pmenu guifg='s:fg4 ' guibg='s:bg2
exe 'hi PmenuSel  guibg='s:bg2
exe 'hi IncSearch guifg='s:bg ' guibg='s:cur
exe 'hi Search guibg='s:comment 'guifg='s:fg ' gui=underline'
exe 'hi Directory guifg='s:const
exe 'hi Folded guifg='s:fg4' guibg='s:bg
exe 'hi WildMenu guifg='s:str ' guibg='s:bg
exe 'hi SignColumn guibg='s:bg2' guifg='s:fg2

exe 'hi Boolean guifg='s:const
exe 'hi Delimiter guifg='s:fg4
exe 'hi Character guifg='s:const
exe 'hi Comment guifg='s:comment ' gui=italic'
exe 'hi Conditional guifg='s:keyword
exe 'hi Constant guifg='s:const
exe 'hi Todo guibg='s:bg
exe 'hi Define guifg='s:keyword
exe 'hi DiffAdd guifg=guibg=#123d0f gui=bold'
exe 'hi DiffDelete guibg='s:bg2
exe 'hi DiffChange  guibg=#151b3c guifg=#fafafa'
exe 'hi DiffText guifg=#ffffff guibg=#ff0000 gui=bold'
exe 'hi ErrorMsg guifg='s:warning ' guibg='s:bg2' gui=bold'
exe 'hi WarningMsg guifg='s:fg ' guibg='s:warning2
exe 'hi Float guifg='s:const
exe 'hi Function guifg='s:func 'gui=bold'
exe 'hi Identifier guifg='s:type
exe 'hi Keyword guifg='s:keyword 'gui=bold'
exe 'hi Label guifg='s:var
exe 'hi NonText guifg='s:bg4 ' guibg='s:bg2
exe 'hi Number guifg='s:keyword
exe 'hi Operater guifg='s:keyword
exe 'hi PreProc guifg='s:keyword
exe 'hi Special guifg='s:fg4
exe 'hi SpecialKey guifg='s:fg2' guibg='s:bg2
exe 'hi Statement guifg='s:keyword
exe 'hi StorageClass guifg='s:keyword
exe 'hi String guifg='s:str
exe 'hi Tag guifg='s:keyword
exe 'hi Title guifg='s:fg ' gui=bold'
exe 'hi Todo guifg='s:fg2 ' gui=inverse,bold'
exe 'hi Type guifg='s:type
exe 'hi Underlinedo gui=underline'
exe 'hi Noise guifg='s:fg4

exe 'hi SpellBad gui=undercurl'
exe 'hi SpellCap gui=undercurl'
exe 'hi SpellLocal gui=undercurl'
exe 'hi SpellRare gui=undercurl'

exe 'hi DiagnosticUnderlineError gui=undercurl'
exe 'hi DiagnosticUnderlineWarn gui=undercurl'
exe 'hi DiagnosticUnderlineInfo gui=undercurl'
exe 'hi DiagnosticUnderlineHint gui=undercurl'

" GitGutter
exe 'hi GitGutterAdd guifg='s:untracked ' ctermfg=2'
exe 'hi GitGutterChange guifg='s:modified ' ctermfg=3'
exe 'hi GitGutterDelete guifg='s:deleted ' ctermfg=1'

" Neovim Terminal Mode
let g:terminal_color_0 = s:bg
let g:terminal_color_1 = s:warning
let g:terminal_color_2 = s:keyword
let g:terminal_color_3 = s:bg4
let g:terminal_color_4 = s:func
let g:terminal_color_5 = s:builtin
let g:terminal_color_6 = s:fg3
let g:terminal_color_7 = s:str
let g:terminal_color_8 = s:bg2
let g:terminal_color_9 = s:warning2
let g:terminal_color_10 = s:fg2
let g:terminal_color_11 = s:var
let g:terminal_color_12 = s:type
let g:terminal_color_13 = s:const
let g:terminal_color_14 = s:fg4
let g:terminal_color_15 = s:comment

" Ruby Highlighting
exe 'hi rubyAttribute guifg='s:builtin
exe 'hi rubyLocalVariableOrMethod guifg='s:var
exe 'hi rubyGlobalVariable guifg='s:var ' gui=italic'
exe 'hi rubyInstanceVariable guifg='s:var
exe 'hi rubyKeyword guifg='s:keyword
exe 'hi rubyKeywordAsMethod guifg='s:keyword ' gui=bold'
exe 'hi rubyClassDeclaration guifg='s:keyword ' gui=bold'
exe 'hi rubyClass guifg='s:keyword ' gui=bold'
exe 'hi rubyNumber guifg='s:const

" Python Highlighting
exe 'hi pythonBuiltinFunc guifg='s:builtin

" Go Highlighting
exe 'hi goBuiltins guifg='s:builtin
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints      = 1
let g:go_highlight_chan_whitespace_error  = 1
let g:go_highlight_extra_types            = 1
let g:go_highlight_fields                 = 1
let g:go_highlight_format_strings         = 1
let g:go_highlight_function_calls         = 1
let g:go_highlight_function_parameters    = 1
let g:go_highlight_functions              = 1
let g:go_highlight_generate_tags          = 1
let g:go_highlight_operators              = 1
let g:go_highlight_space_tab_error        = 1
let g:go_highlight_string_spellcheck      = 1
let g:go_highlight_types                  = 1
let g:go_highlight_variable_assignments   = 1
let g:go_highlight_variable_declarations  = 1

" Javascript Highlighting
exe 'hi jsBuiltins guifg='s:builtin
exe 'hi jsFunctionCall guifg='s:keyword ' gui=bold'
exe 'hi jsFunction guifg='s:fg4
exe 'hi jsClassFuncName guifg='s:builtin
exe 'hi jsGlobalObjects guifg='s:type
exe 'hi jsAssignmentExps guifg='s:var
exe 'hi jsString guifg='s:var
exe 'hi jsObjectKey guifg='s:builtin
exe 'hi jsGlobalNodeObjects guifg='s:builtin
" Html Highlighting
exe 'hi htmlLink guifg='s:var' gui=underline'
exe 'hi htmlStatement guifg='s:keyword
exe 'hi htmlSpecialTagName guifg='s:keyword

" Markdown Highlighting
exe 'hi mkdCode guifg='s:builtin

" lightline
let s:base0 = s:fg
let s:base1 =  s:fg
let s:base2 = s:fg
let s:base3 = s:fg
let s:base00 = s:bg2
let s:base01 = s:bg2
let s:base02 = s:bg2
let s:base023 = s:bg
let s:base03 = s:bg
let s:yellow = 'yellow'
let s:orange = 'orange'
let s:red = 'red'
let s:magenta = 'magenta'
let s:blue = 'blue'
let s:cyan = s:blue
let s:green = 'green'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:bg2, s:fg4 ], [ s:base3, s:base01 ] ]
let s:p.normal.middle = [ [ s:fg4, s:bg2 ] ]
let s:p.normal.right = [ [ s:bg2, s:fg4 ], [ s:base1, s:base01 ] ]
let s:p.inactive.left =  [ [ s:base1, s:base01 ], [ s:base3, s:base01 ] ]
let s:p.inactive.middle = [ [ s:base1, s:base023 ] ]
let s:p.inactive.right = [ [ s:base1, s:base01 ], [ s:base2, s:base02 ] ]
let s:p.insert.left = [ [ s:base02, s:fg2 ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:base023, s:fg3 ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:base02, s:keyword ], [ s:base3, s:base01 ] ]
let s:p.tabline.tabsel = [ [ s:base02, s:base03 ] ]
let s:p.tabline.left = [ [ s:base3, s:base00 ] ]
let s:p.tabline.middle = [ [ s:base2, s:base02 ] ]
let s:p.tabline.right = [ [ s:base2, s:base00 ] ]
let s:p.normal.error = [ [ s:base03, s:warning ] ]
let s:p.normal.warning = [ [ s:base023, s:warning2 ] ]

exe 'hi DashboardFooter gui=italic'

