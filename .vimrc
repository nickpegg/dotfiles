set nocompatible

set nobackup
set nowritebackup
set history=50
set ruler
set showcmd
set incsearch
set laststatus=2

syntax on

set number
set numberwidth=5

set tabstop=2
set shiftwidth=2
set expandtab
"set smarttab

set splitbelow
set splitright

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Language-specific settings
if filereadable(expand("~/.vimrc.languages"))
  source ~/.vimrc.languages
endif

"AirlineTheme simple

" DetectIndent settings
let g:detectindent_preferred_expandtab=1
let g:detectindent_preferred_indent=2
augroup DetectIndent
  autocmd!
  autocmd BufReadPost * DetectIndent
augroup END

" Fix trailing whitespace on save
augroup onsave
  autocmd!
  autocmd BufWritePost * FixWhitespace
augroup END

" Break bad habits
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
