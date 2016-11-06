set nocompatible

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

set background=dark
let g:solarized_termcolors=256
colorscheme solarized

AirlineTheme simple
