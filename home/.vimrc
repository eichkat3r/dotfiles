set nocompatible
syntax on

" Setup Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ornicar/html-template-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'chrisbra/Colorizer'
Plugin 'enomsg/vim-haskellConcealPlus'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ajmwagar/vim-deus'
Plugin 'chrisbra/csv.vim'

call vundle#end()
filetype plugin indent on

set nowrap
set ignorecase
set ffs=unix
set hlsearch
set noswapfile
set number

"let g:rainbow_active=1
let g:Powerline_symbols='fancy'
let g:livepreviewer_previewer='zathura'

" show statusbar in single buffer windows
set laststatus=2

" default indent
set tabstop=4
set shiftwidth=4
set noexpandtab

set foldmethod=syntax
set foldlevel=20

au StdinReadPre * let s:std_in=1

" filetype specific indent
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef __" . gatename
  execute "normal! o#define __" . gatename . "\n\n\n"
  execute "normal! Go#endif /* __" . gatename . " */"
  normal! kk
endfunction

au BufNewFile *.{h,hpp} call <SID>insert_gates()
au FileType python setlocal shiftwidth=4 tabstop=4 et
au FileType coffee setlocal shiftwidth=2 tabstop=2 et
au FileType asm setlocal shiftwidth=2 tabstop=2 et
au FileType cpp setlocal shiftwidth=4 tabstop=4 noet
au FileType c setlocal shiftwidth=4 tabstop=4 noet
au FileType h setlocal shiftwidth=4 tabstop=4 noet
au FileType julia setlocal shiftwidth=2 tabstop=2 et
au FileType sh setlocal shiftwidth=4 tabstop=4 noet
au FileType haskell setlocal shiftwidth=4 tabstop=4 et
au FileType html setlocal shiftwidth=2 tabstop=2 noet
au FileType markdown setlocal shiftwidth=2 tabstop=2 noet nospell
au FileType json setlocal shiftwidth=2 tabstop=2 noet
au FileType rs setlocal shiftwidth=2 tabstop=2 noet

:let g:colorizer_auto_filetype='css,html'

if has("mouse")
  set mouse=a
"  map <ScrollWheelUp> <C-y>
"  map <ScrollWheelDown> <C-e>
endif
set clipboard+=unnamed
set list
set listchars=tab:\|―,space:·,trail:·
" turn off bell
set vb t_vb=
set autoindent
" do not remove indentation on blank lines
inoremap <CR> <CR>x<BS>
nnoremap o ox<BS>
nnoremap O Ox<BS>

set backspace=indent,eol,start

set nocompatible

set background=light
colorscheme bubblegum-256-light
hi SpecialKey ctermfg=0

" highlight character border
let &colorcolumn=join(range(80, 999),",")
hi ColorColumn ctermbg=white

" highlight current line without underline
set cursorline
hi CursorLine cterm=NONE ctermbg=white

hi LineNr ctermfg=black
hi LineNr ctermbg=white
au InsertEnter * hi LineNr ctermfg=blue
au InsertLeave * hi LineNr ctermfg=blue

" set split char
"set fillchars+=vert:│
set fillchars+=vert:\ 
au ColorScheme * hi VertSplit cterm=NONE ctermfg=Green ctermbg=NONE

" split behavior
set splitbelow
set splitright

" source local vim rc
set exrc
set secure

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:nerdtree_tabs_open_on_console_startup=2

nmap <F8> :TagbarToggle<CR>

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
