"" ek9/vim-config - https://github.com/ek9/vim-config
"" .vimrc / init.vim - vim and nvim config
""
"" Index
""  - PLUGINS managed by vim-plug
""  - GENERAL config
""  - FILETYPES
""  - HOTKEYS

"" Setup plugin system (vim-plug)
if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

"" Plugins (vim-plug)
" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'ek9/vim-auto-solarize'
Plug 'nathanaelkane/vim-indent-guides'

" Core
Plug 'scrooloose/nerdtree'
" autostart on launch if no file specified
autocmd vimenter * if !argc() | NERDTree | endif
" autoclose if the only window that is open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" map Ctrl+n to NERDTree
map <C-n> :NERDTreeToggle<CR>

Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/syntastic'
Plug 'myint/syntastic-extras'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
Plug 'vim-scripts/comments.vim'
Plug 'tpope/vim-dotenv'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'godlygeek/tabular'
Plug 'farmergreg/vim-lastplace'
Plug 'vim-scripts/Align'
Plug 'ctrlpvim/ctrlp.vim'

"" Filetype specific
Plug 'Firef0x/PKGBUILD.vim', { 'for': 'PKGBUILD' }
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'saltstack/salt-vim', { 'for': ['sls', 'pillar.example'] }
Plug 'mustache/vim-mustache-handlebars', { 'for': 'hbs' }
Plug 'stephpy/vim-yaml', { 'for': ['php', 'yml', 'yaml'] }
Plug 'tpope/vim-haml', { 'for': ['css', 'scss', 'sass', 'less' ] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'less' ] }
augroup VimCSS3Syntax
    autocmd!

    autocmd FileType css setlocal iskeyword+=-
augroup END
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'sass'] }
Plug 'tobyS/vmustache', { 'for': 'php' }
Plug 'tobyS/pdv', { 'for': 'php' }
Plug 'ternjs/tern_for_vim', { 'for': 'js' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'js' }
Plug 'sukima/xmledit', { 'for': 'xml' }
Plug 'valloric/MatchTagAlways', { 'for': ['xml', 'html', 'twig', 'hbs'] }

" PHP
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'for': ['php'] }
  Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install', 'for': ['php'] }
else
  Plug 'Shougo/deoplete.nvim', { 'for': ['php'] }
  Plug 'roxma/nvim-yarp', { 'for': ['php'] }
  Plug 'roxma/vim-hug-neovim-rpc' , { 'for': ['php'] }
  Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install', 'for': ['php'] }
endif
let g:deoplete#enable_at_startup = 1

"" Initialize plugin system (vim-plug)
call plug#end()

""" GENERAL CONFIG

"" provided by tpope/vim-sensible
set encoding=utf-8
set showcmd                    " show commands typed
set autoread                   " refresh if changed
set history=1000               " default 20
set incsearch                  " 'live'-search
set smarttab                   " tab to 0,4,8 etc.
set autoindent                 " preserve indentation
set backspace=indent,eol,start " smart backspace
syntax on                      " syntax highlighting

"" general
set nocompatible  " vi iMproved
set vb t_vb=      " disable visual bell
set ttyfast       " fast redraw
set mouse=        " disable mouse
set noexrc        " don't use other .*rc(s)
set confirm       " confirm changed files
set nostartofline " keep cursor column pos
set splitbelow    " split bottom instead of top
set splitright    " split right instead of left

"" display
set t_Co=16        " use 16 colors
set textwidth=80   " set column width for wrap
set cursorline     " highlight current line
set colorcolumn=+1 " show vertical line on column wrap
set scrolloff=5    " scroll off 5 lines near cursor
set title          " use title
set number         " show line numbers
let g:auto_solarize_disabled = 1

"" syntax
set cinkeys-=0#                         " don't force # indentation
set ignorecase                          " by default ignore case
set nrformats+=alpha                    " incr/decr letters C-a/-x
set shiftround                          " be clever with tabs
set shiftwidth=4                        " default 8
set smartcase                           " sensitive with uppercase
set softtabstop=4                       " tab feels like <tab>
set tabstop=4                           " replace <TAB> w/4 spaces
set expandtab                           " no real tabs

"" spelling
set spelllang=en         " languages

" word wrap
set iskeyword+=_,$,@,%,# " not word dividers
set nolist               " wraps to whole words
set linebreak            " don't cut words on wrap

" search
set hlsearch    " Highlight results
set ignorecase  " Ignore casing of searches
set incsearch   " Start showing results as you type
set smartcase   " Be smart about case sensitivity when searching
set gdefault    " Substitution is global by default. g to toggle
set showmatch   " Highlight matching braces
set matchtime=5 "


"" files and directories
set backup                        " enable backup file
set undofile                      " enable undo file
set noswapfile                    " disable swap file
if has('nvim')
    set undodir=/tmp/nvim-$USER/undo/  " Undodir
    set backupdir=/tmp/nvim-$USER/backup/ " Backupdir.
else
    set undodir=/tmp/vim-$USER/undo/  " Undodir
    set backupdir=/tmp/vim-$USER/backup/ " Backupdir.
endif
" make sure directories exist
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif

" match git merge/rebase conflicts as errors
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

""" FILETYPES

" configure two spaces to be used as tab for certain filetypes 
autocmd FileType twig,html,htm,xhtml,pp,sls :setlocal sw=2 ts=2 sts=2
" disable folding of markdown files
let g:vim_markdown_folding_disabled = 1
" use github flavored markdown for md files
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.md.txt,*.markdown setlocal filetype=ghmarkdown
augroup END


""" HOTKEYS

" disable default hotkeys
inoremap <F1> <nop>
nnoremap <F1> <nop>
vnoremap <F1> <nop>
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
inoremap <Left> <Esc>:echoe "Use CTRL-["<CR>i<CR>
inoremap <Right> <Esc>:echoe "Use CTRL-["<CR>i<CR>
inoremap <Up> <Esc>:echoe "Use CTRL-["<CR>i<CR>
inoremap <Down> <Esc>:echoe "Use CTRL-["<CR>i<CR>

" map <F1> to toggle spell in all modes
nmap <silent> <F1> :setlocal spell!<CR>
vmap <silent> <F1> :setlocal spell!<CR>
imap <silent> <F1> <Esc>:setlocal spell!<CR>

" map <F2> to toggle paste mode
set pastetoggle=<F2>

" map <F3> to toggle line numbers
nnoremap <F3> :set invnumber<CR>
vnoremap <F3> :set invnumber<CR>
inoremap <F3> <Esc>:set invnumber<CR>

" map <F4> for gundo
nnoremap <F4> :GundoToggle<CR>

" map <F5> for Toggle Whitespace
nnoremap <F5> :ToggleWhitespace<CR>

" map Ctrl+L to line open / line close
nnoremap <C-l> :lopen<CR>
vnoremap <C-l> :lopen<CR>
inoremap <C-l> <Esc>:lopen<CR>

" use :w!! for sudo write
cnoremap w!! w !sudo tee % >/dev/null

"  cancel the default behavior of paste writing overwritten content to clipboard
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction
" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <sid>Repl()

" tab navigation with Ctrl+hjkl
nnoremap <silent> <C-h> :tabp<CR>
nnoremap <silent> <C-l> :tabn<CR>
nnoremap <silent> <C-k> :tablast<CR>
nnoremap <silent> <C-j> :tabfirst<CR>
vnoremap <silent> <C-h> <Esc>:tabp<CR>
vnoremap <silent> <C-l> <Esc>:tabn<CR>
vnoremap <silent> <C-k> <Esc>:tablast<CR>
vnoremap <silent> <C-j> <Esc>:tabfirst<CR>
inoremap <silent> <C-h> <Esc>:tabp<CR>
inoremap <silent> <C-l> <Esc>:tabn<CR>
inoremap <silent> <C-k> <Esc>:tablast<CR>
inoremap <silent> <C-j> <Esc>:tabfirst<CR>

"" window split hotkeys
" horizontal (Ctrl+v)
nmap <silent> <C-s> :split<CR>
vmap <silent> <C-s> :split<CR>
imap <silent> <C-s> <Esc>:split<CR>
" vertical (Ctrl+v)
nmap <silent> <C-v> :vsplit<CR>
vmap <silent> <C-v> :vsplit<CR>
imap <silent> <C-v> <Esc>:vsplit<CR>
" window split navigation (Shift+hjkl)
nnoremap <S-J> <C-W>j
nnoremap <S-K> <C-W>k
nnoremap <S-L> <C-W>l
nnoremap <S-H> <C-W>h
vnoremap <S-J> <C-W>j
vnoremap <S-K> <C-W>k
vnoremap <S-L> <C-W>l
vnoremap <S-H> <C-W>h
" resize horzontal split window (with +,_,>,<)
if bufwinnr(1)
    nnoremap + <C-W>+
    nnoremap _ <C-W>-
    vnoremap + <C-W>+
    vnoremap _ <C-W>-
    nnoremap > <C-W>>
    nnoremap < <C-W><
    vnoremap > <C-W>>
vnoremap < <C-W><
endif

