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
" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'ek9/vim-auto-solarize'
" Core
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTree'] }
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/syntastic'
Plug 'myint/syntastic-extras'
Plug 'vim-scripts/comments.vim'
Plug 'tpope/vim-dotenv'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'tmux-plugins/vim-tmux-focus-events'

" Filetype specific
Plug 'Firef0x/PKGBUILD.vim', { 'for': 'PKGBUILD' }
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'saltstack/salt-vim', { 'for': 'sls' }
Plug 'mustache/vim-mustache/handlebars', { 'for': 'hbs' }
Plug 'stephpy/vim-yaml', { 'for': ['php', 'yml', 'yaml'] }
Plug 'tpope/vim-haml', { 'for': ['css', 'scss', 'sass', 'less' ] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss', 'sass', 'less' ] }

" vimrc config plugin - load at the end
Plug 'ek9/vimrc'

"" Initialize plugin system (vim-plug)
call plug#end()

"" plugin config


" NERDTree
" autostart on launch if no file specified
autocmd vimenter * if !argc() | NERDTree | endif
" autoclose if the only window that is open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" map Ctrl+n to NERDTree
map <C-n> :NERDTreeToggle<CR>

"" css3 plugin
augroup VimCSS3Syntax
    autocmd!

    autocmd FileType css setlocal iskeyword+=-
augroup END
