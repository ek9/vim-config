"" ek9/vim-config - https://github.com/ek9/vim-config
"" .vimrc

"" Setup plugin system (vim-plug)
" Specify a directory for plugins
if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

"" Plugins (vim-plug)
Plug 'altercation/vim-colors-solarized'
Plug 'ek9/vim-auto-solarize'
Plug 'ek9/vimrc'

"" Initialize plugin system (vim-plug)
call plug#end()

