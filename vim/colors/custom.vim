" This script is a modified version taken from the base16-shell repository.
" https://github.com/chriskempson/base16-shell"

" GUI color definitions
let s:g00 = "202020" " Black
let s:g01 = "ff5370" " Red
let s:g02 = "50fa7b" " Green
let s:g03 = "ffb86c" " Yellow
let s:g04 = "51cdff" " Blue
let s:g05 = "ff79c6" " Magenta
let s:g06 = "bd93f9" " Cyan
let s:g07 = "f8f8f2" " White
let s:g08 = "1c1c1c" " Black (bright)
let s:g09 = "ff5370" " Red (bright)
let s:g10 = "50fa7b" " Green (bright)
let s:g11 = "ffb86c" " Yellow (bright)
let s:g12 = "51cdff" " Blue (bright)
let s:g13 = "ff79c6" " Magenta (bright)
let s:g14 = "bd93f9" " Cyan (bright)
let s:g15 = "414141" " White (bright)

" Terminal color definitions
let s:t00 = "00" " Black
let s:t01 = "01" " Red
let s:t02 = "02" " Green
let s:t03 = "03" " Yellow
let s:t04 = "04" " Blue
let s:t05 = "05" " Magenta
let s:t06 = "06" " Cyan
let s:t07 = "07" " White
let s:t08 = "08" " Black (bright)
let s:t09 = "09" " Red (bright)
let s:t10 = "10" " Green (bright)
let s:t11 = "11" " Yellow (bright)
let s:t12 = "12" " Blue (bright)
let s:t13 = "13" " Magenta (bright)
let s:t14 = "14" " Cyan (bright)
let s:t15 = "15" " White (bright)

" Theme setup
set background=dark
highlight clear
syntax reset
let g:colors_name = "custom"

" Highlighting function
fun <sid>hi(group, guifg, guibg, ctermfg, ctermbg, attr)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=#" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=#" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
endfun

" Vim editor colors
call <sid>hi("ColorColumn", "", s:g08, "", s:t08, "none")
call <sid>hi("Cursor", s:g00, s:g08, s:t00, s:t08, "none")
call <sid>hi("CursorColumn", "", s:g08, "", s:t08, "none")
call <sid>hi("CursorLine", "", s:g08, "", s:t08, "none")
call <sid>hi("CursorLineNR", s:g04, s:g08, s:t04, s:t08, "none")
call <sid>hi("ErrorMsg", s:g07, s:g01, s:t07, s:t01, "bold")
call <sid>hi("Folded", s:g04, s:g00, s:t04, s:t00, "bold")
call <sid>hi("IncSearch", s:g00, s:g03, s:t00, s:t03, "bold")
call <sid>hi("LineNr", s:g15, s:g08, s:t15, s:t08, "none")
call <sid>hi("MatchParen", s:g00, s:g07, s:t00, s:t07, "none")
call <sid>hi("Normal", s:g07, "", s:t07, "", "none")
call <sid>hi("Question", s:g06, s:g00, s:t06, s:t00, "bold")
call <sid>hi("Search", s:g00, s:g02, s:t00, s:t02, "bold")
call <sid>hi("StatusLine", s:g00, s:g07, s:t00, s:t07, "bold")
call <sid>hi("StatusLineNC", s:g00, s:g15, s:t00, s:t15, "none")
call <sid>hi("VertSplit", s:g08, s:g00, s:t08, s:t00, "none")
call <sid>hi("Visual", s:g07, s:g05, s:t07, s:t05, "none")
call <sid>hi("WarningMsg", s:g07, s:g00, s:t07, s:t00, "bold")

" Remove function and color variables
delf <sid>hi
unlet s:g00 s:g01 s:g02 s:g03 s:g04 s:g05 s:g06 s:g07 s:g08 s:g09 s:g10 s:g11 s:g12 s:g13 s:g14 s:g15
unlet s:t00 s:t01 s:t02 s:t03 s:t04 s:t05 s:t06 s:t07 s:t08 s:t09 s:t10 s:t11 s:t12 s:t13 s:t14 s:t15
