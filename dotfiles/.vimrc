set background=dark
set nocompatible
syntax on " enable
set ruler
set confirm
set number

" tab spacing
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set exrc
set secure
set autoindent

" open split windows below and right rather than above and left set splitbelow set splitright
set splitbelow
set splitright

" colorscheme choice
" colorscheme darkblue

" call pathogen#infect()

" preserve tab level
set autoindent

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
" nnoremap <silent> <F9> :TagbarToggle<CR>
nnoremap ,s :exe 'grep ' . expand('<cword>') . ' *'<CR>

" turn on search highlighting
set hlsearch
" reset highlighting
nnoremap <silent> <C-I> :nohl <CR> :IndentGuidesEnable <CR> " reset syntax highlighting nnoremap <C-S> :syntax sync fromstart <CR>

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

" make fortran free form, not fixed
let fortran_free_source = 1

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
" let g:NERDTreeDirArrowExpandable='+'
" let g:NERDTreeDirArrowCollapsible='~'

"+++indent guides settings
" augroup indent_settings
"   "auto-folds with indents
"   au BufReadPre * setlocal foldmethod=indent
"   "save folds when closing
"   au BufWinLeave *.* mkview
"   au BufWinEnter *.* silent loadview
"   "set up indent guides
"   let g:indent_guides_auto_colors=0
"   autocmd VimEnter,Colorscheme * hi IndentGuidesEven ctermbg=5
"   let g:indent_guides_start_level=2
"   let g:indent_guides_guide_size=1
"   let g:indent_guides_enable_on_vim_startup=1
"   let g:indent_guides_default_mapping = 0
" augroup END

"+++Tagbar settings
" nnoremap ,t :TagbarTogglePause <CR>
let g:tagbar_width = 30
let g:tagbar_sort = 0
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_autoshowtag = 1
" autocmd FileType * nested :call tagbar#autoopen(0) let g:tagbar_status_func = 'rcfunc#TagbarStatusFunc'
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif autocmd CursorMovedI * if pumvisible() == 0|pclose|endif

"When a new window is entered
" autocmd BufEnter __Tagbar__  :call rcfunc#killIDE() autocmd BufEnter NERD_tree*  :call rcfunc#killIDE()

" Tag setup and generation
" Opens up NERDTree and tagbar if tags exist " add root directory containing arch tags if it exists let &tags="./.tags,.master_tags,"
" autocmd BufWritePost *.* :call rcfunc#genLocalTags() au BufEnter *.* :call rcfunc#Setup_tags()
