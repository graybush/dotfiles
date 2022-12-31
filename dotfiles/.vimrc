set nocompatible
set path+=**

command! MakeTags !ctags -R .
" set tags+=${HOME}/.tags/tags

syntax enable

let g:netrw_banner=0
" let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S+'

set backspace=2
set background=dark
set confirm
set hlsearch
set incsearch
set ruler
set wildmenu
set wildoptions=pum

set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" open split windows below and right rather than above and left
set splitbelow
set splitright

" enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" flagging unnecessary whitepace
au BufRead,BufNewFile * match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.java
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=100

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 softtabstop=2 shiftwidth=2

" hotkeys
nnoremap <C-j> :resize +3 <CR>
nnoremap <C-k> :resize -3 <CR>
nnoremap <C-h> :vertical resize -3 <CR>
nnoremap <C-l> :vertical resize +3 <CR>

nnoremap <F9> :Tagbar <CR>
nnoremap <F10> :call ToggleOverLength() <CR>
nnoremap <F11> :call ToggleTrailingSpace() <CR>

map <C-]> <C-w><C-]><C-w>T

" status line always on
set laststatus=2
" status line format
" set statusline=%<\ %F\ %h%r%m%=%-14.(%l,%c%V%)\ %P
set statusline=
set statusline+=%3*
set statusline+=%3*%<\ %F\ %h%r%m
set statusline+=%1*
" set statusline+=\ %*
" swithcing to the right side
set statusline+=%=
set statusline+=%3*
set statusline+=%-14.(%l,%c%V%)\ %P
set statusline+=\ %*

hi User1 ctermfg=yellow guibg=green guifg=red
hi User2 ctermbg=red   ctermfg=blue  guibg=red   guifg=blue
hi User3 ctermbg=blue  ctermfg=green guibg=blue  guifg=green
" hi User1 ctermbg=blue  ctermfg=red   guibg=green guifg=red
" hi User2 ctermbg=red   ctermfg=blue  guibg=red   guifg=blue
" hi User3 ctermbg=blue  ctermfg=green guibg=blue  guifg=green
" ++++++++ specific instructions for different filetypes

" define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred

""""""""""""""""""""""""""""""""""""""
" 100 char limit
""""""""""""""""""""""""""""""""""""""
let g:over_length_enabled=0
function ToggleOverLength()
   if g:over_length_enabled==1
      hi clear OverLength
      let g:over_length_enabled=0
   else
      highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
      match OverLength /\%>80v.\+/
      let g:over_length_enabled=1
   endif
endfunction

""""""""""""""""""""""""""""""""""""""
" Trailing whitespace
""""""""""""""""""""""""""""""""""""""
let g:trailing_space_enabled=0
function ToggleTrailingSpace()
   if g:trailing_space_enabled==1
      hi clear ExtraWhitespace
      let g:trailing_space_enabled=0
   else
      highlight ExtraWhitespace ctermbg=darkred guibg=darkred
      match ExtraWhitespace /\s\+$/
      let g:trailing_space_enabled=1
   endif
endfunction


if &diff
   highlight DiffAdd cterm=none ctermfg=black ctermbg=Green gui=none guifg=black guibg=Green
   highlight DiffDelete cterm=none ctermfg=black ctermbg=Red gui=none guifg=black guibg=Red
   highlight DiffChange cterm=none ctermfg=black ctermbg=Yellow gui=none guifg=black guibg=Yellow
   highlight DiffText cterm=none ctermfg=black ctermbg=Magenta gui=none guifg=black guibg=Magenta
endif
