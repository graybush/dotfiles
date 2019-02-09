" vundle required
set nocompatible
filetype off

" set the runtime path to include Vundle and init
set rtp+=${HOME}/.vim/bundle/vundle
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
" Plugin 'tmhedberg/SimpylFold'
" Plugin 'vim-scripts/indentpython.vim'
" Plugin 'vim-syntastic/syntastic'
" Plugin 'nvie/vim-flake8'
" super searching
" Plugin 'kien/ctrlp.vim'
" Bundle 'Valloric/YouCompleteMe'

" all plugins must be added before here
call vundle#end()
filetype plugin indent on


set background=dark
set confirm
set encoding=utf-8
set exrc
set hlsearch
set nocompatible
set number
" set relativenumber
set ruler
set secure
set showcmd
set wildmenu

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

syntax enable

" flagging unnecessary whitepace
au BufRead,BufNewFile *.java,*.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.py:
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css:
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" hotkeys
nnoremap <C-j> :resize +3 <CR>
nnoremap <C-k> :resize -3 <CR>
nnoremap <C-h> :vertical resize -3 <CR>
nnoremap <C-l> :vertical resize +3 <CR>

nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

nnoremap <C-i> :nohl <CR>
nnoremap <C-n> :NERDTreeToggle <CR>
nnoremap <F9> :Tagbar <CR>
nnoremap <F10> :call ToggleOverLength() <CR>
nnoremap <F11> :call ToggleTrailingSpace() <CR>


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

let python_highlight_all=1

" force shell highlighting to be bash
let g:is_bash = 1

"+++NERDTree settings
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='~'

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
