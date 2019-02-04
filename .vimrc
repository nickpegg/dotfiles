set nocompatible

silent !mkdir -p $HOME/.tmp/vim/

set directory=$HOME/.tmp/vim//

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

set scrolloff=5

"show a line at column 80
set colorcolumn=80

set splitbelow
set splitright

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" colorscheme stuff
set background=dark
let g:solarized_termcolors=256
" colorscheme solarized
let g:gruvbox_contrast_light='hard'
colorscheme gruvbox

" Language-specific settings
if filereadable(expand("~/.vimrc.languages"))
  source ~/.vimrc.languages
endif

filetype plugin on

"AirlineTheme simple

" DetectIndent settings
let g:detectindent_preferred_expandtab=1
let g:detectindent_preferred_indent=2
augroup DetectIndent
  autocmd!
  autocmd BufReadPost * DetectIndent
augroup END

" js settings
let g:jsx_ext_required = 0

" ctrlp settings
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules$',
  \ }

let g:ctrlp_show_hidden = 1

" Fix trailing whitespace on save
let g:strip_whitespace_on_save = 1

" Disable python-mode's space errors since vim-better-whitespace does it
" better
let g:pymode_syntax_space_errors = 0

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

" Include any machine/loality-specific things, try to keep this .vimrc
" standard across everything
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
