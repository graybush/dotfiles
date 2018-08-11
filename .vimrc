set autoindent
set background=dark
set confirm
set exrc
set hlsearch
set nocompatible
set number
set ruler
set secure
set showcmd
set wildmenu

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent

" open split windows below and right rather than above and left set splitbelow 
" set splitright
set splitbelow
set splitright

syntax enable

" autoindent based on syntax
filetype on
filetype plugin indent on
filetype plugin on

" hotkeys
nnoremap <C-j> :resize +3 <CR>
nnoremap <C-k> :resize -3 <CR>
nnoremap <C-h> :vertical resize -3 <CR>
nnoremap <C-l> :vertical resize +3 <CR>
map <C-n> : NERDTreeToggle<CR>
nnoremap <F10> :call ToggleOverLength() <CR>
nnoremap <C-I> :nohl <CR>


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

" force shell highlighting to be bash
let g:is_bash = 1

" define filetypes
augroup filetypedetect
    au! BufNewFile, BufRead *.f90? setfiletype fortran
    au! BufNewFile, BufRead bash* setfiletype sh
    au! BufNewFile, BufRead Make* :call rcfunc#Setup_Makefiles()
    au! BufNewFile, BufRead *.vim setfiletype vim
    au! BufNewFile, BufRead *.py setfiletype python
    au! BufNewFile, BufRead *.json setfiletype json augroup END

"+++NERDTree settings
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='~'

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

if &diff
   highlight DiffAdd cterm=none ctermfg=black ctermbg=Green gui=none guifg=black guibg=Green
   highlight DiffDelete cterm=none ctermfg=black ctermbg=Red gui=none guifg=black guibg=Red
   highlight DiffChange cterm=none ctermfg=black ctermbg=Yellow gui=none guifg=black guibg=Yellow
   highlight DiffText cterm=none ctermfg=black ctermbg=Magenta gui=none guifg=black guibg=Magenta
endif
