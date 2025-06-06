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

if filereadable(expand("~/.vimrc.plugins"))
  source ~/.vimrc.plugins
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

" fzf settings
map <C-p> :GFiles <CR>

" Fix trailing whitespace on save
" let g:better_whitespace_enabled = 1
" let g:strip_whitespace_on_save = 1
" let g:strip_whitespae_confirm=0

" Disable python-mode's space errors since vim-better-whitespace does it
" better
let g:pymode_syntax_space_errors = 0
let g:pymode_lint_on_write = 0  " Wow this is annoying

" Format python code
if exists("g:load_black")
  autocmd BufWritePre *.py execute ':Black'
endif

" Black uses 88 character lines rather than 80
autocmd BufNewFile,BufRead *.py set colorcolumn=89
autocmd BufNewFile,BufRead *.py set textwidth=88

" Use 100 char lines in golang
autocmd BufNewFile,BufRead *.go set colorcolumn=101
autocmd BufNewFile,BufRead *.go set textwidth=100

" 100 char lines for Markdown
autocmd BufNewFile,BufRead *.md set colorcolumn=101
autocmd BufNewFile,BufRead *.md set textwidth=100

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

" vimwiki
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [
      \ {
        \ 'path': '~/vimwiki/',
        \ 'syntax': 'markdown',
        \ 'ext': '.md',
        \ 'path_html': '~/vimwiki/site_html',
        \ 'custom_wiki2html': 'vimwiki_markdown',
        \ 'template_path': '~/vimwiki/_build/templates',
      \ },
      \ ]

" ALE
set omnifunc=ale#completion#OmniFunc
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {
\  'rust': ['rustfmt'],
\  '*': ['remove_trailing_lines', 'trim_whitespace']
\}
let g:ale_fix_on_save = 1
" If things get too annoying
" g.ale_lint_on_text_changed = 'never'
" g.ale_lint_on_insert_leave = 0

" ALE mappings
map <Leader>d :ALEGoToDefinition -split <CR>
map <Leader>gd :ALEGoToDefinition <CR>
map <Leader>i :ALEGoToImplementation -split <CR>
map <Leader>gi :ALEGoToImplementation <CR>
map <Leader>r :ALEFindReferences <CR>
map <Leader>l :ALEPopulateLocList <CR>
map <Leader>h :ALEHover <CR>
map <Leader>ss :ALESymbolSearch
map <Leader>d :ALEDetail <CR>
map <Leader>f :ALEFirst <CR>
map <Leader>n :ALENextWrap <CR>
map <Leader>g :ALENextWrap <CR>

" Include any machine/loality-specific things, try to keep this .vimrc
" standard across everything
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
