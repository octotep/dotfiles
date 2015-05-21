" Install vim plug if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" Init vim-plug
call plug#begin('~/.vim/bundle')

" Misc stuff
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'kana/vim-textobj-user'
Plug 'Julian/vim-textobj-brace'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'sgur/vim-textobj-parameter'
Plug 'kana/vim-textobj-syntax'
Plug 'rbonvall/vim-textobj-latex', { 'for': ['tex', 'latex'] }
Plug 'coderifous/textobj-word-column.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'farseer90718/vim-taskwarrior'
Plug 'haya14busa/incsearch.vim'
Plug 'tommcdo/vim-exchange'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'tpope/vim-fugitive'
Plug 'bruno-/vim-vertical-move'
Plug 'bling/vim-airline'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
" Plug 'maxbrunsfeld/vim-yankstack'
Plug 'Shougo/unite.vim'
Plug 'justinmk/vim-sneak'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/syntastic'
Plug 'rstacruz/sparkup', { 'for': ['xhtml', 'html', 'xml'] }
Plug 'majutsushi/tagbar'
Plug 'dhruvasagar/vim-table-mode'
Plug 'luochen1990/rainbow'
Plug 'sjl/gundo.vim'

" Complicated stuff
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --system-libclang --omnisharp-completer' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Clojure stuff
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'tpope/vim-leiningen', { 'for': 'clojure' }

" Go stuff
Plug 'fatih/vim-go'

" Colorscheme stuff
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'
Plug 'jaxbot/semantic-highlight.vim'

" " Note taking stuff
Plug 'LaTeX-Box-Team/LaTeX-Box', { 'for': ['latex', 'tex'] }
Plug 'cwoac/nvim', { 'on': 'Nvim' }
Plug 'tpope/vim-markdown', { 'for': ['markdown', 'mkd'] }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': ['markdown', 'pandoc'] }
Plug 'vim-pandoc/vim-pandoc', { 'for': ['pandoc', 'markdown'] }
Plug 'vimwiki/vimwiki'

" end vim-plug
call plug#end()

" good stuff to have
filetype plugin indent on
set nocompatible

" Normal vimrc stuff
set mouse=a
syntax on
set background=dark
" colorscheme solarized
set t_ut=
set t_Co=256
colors zenburn
set cursorline
set bs=2

set scrolloff=3 " Keep at least 3 lines before cursor

set encoding=utf-8
set relativenumber
set number

set tabstop=4
set shiftwidth=4
set autoindent

set hlsearch
set incsearch
set guioptions-=T

" Use hard tabs for indent
set noexpandtab

" set time out lengths
set timeoutlen=1000
set ttimeoutlen=100

"0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['darkgray', 'darkblue', 'darkmagenta', 'darkcyan'],
\   'operators': '_,_',
\   'parentheses': [['(',')'], ['\[','\]'], ['{','}']],
\   'separately': {
\       '*': {},
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\           'ctermfgs': ['darkgray', 'darkblue', 'darkmagenta', 'darkcyan', 'darkred', 'darkgreen'],
\       },
\       'clojure': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\           'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\       },
\       'vim': {
\           'parentheses': [['fu\w* \s*.*)','endfu\w*'], ['for','endfor'], ['while', 'endwhile'], ['if','_elseif\|else_','endif'], ['(',')'], ['\[','\]'], ['{','}']],
\       },
\       'tex': {
\           'parentheses': [['(',')'], ['\[','\]'], ['\\begin{.*}','\\end{.*}']],
\       },
\       'css': 0,
\       'stylus': 0,
\   }
\}

" Handle delimitMate differently for different filetypes
au! FileType clojure let b:loaded_delimitMate=1
au! FileType markdown let b:delimitMate_matchpairs = "(:),[:]"

" Display tabs as four characters wide
try
	set shiftwidth=0 " make 'sw' use the value of 'tabstop'
catch /^Vim\%((\a\+)\)\=:E487/ " before Vim 7.4, Vim did not support the value 0
	set shiftwidth=4
endtry
try
	set softtabstop=-1 " make 'sts' use the value of 'sw'
catch /^Vim\%((\a\+)\)\=:E487/ " before Vim 7.4, Vim did not support the value -1
	" I usually won’t need this because expandtab will be off, but setting
	"  this makes changing expandtab simpler
	set softtabstop=4
endtry
set tabstop=4

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
command! WQ wq
command! Wq wq
command! W w
command! Q q

" screenshotting stuff
function! ScrshotFunc(name)
	execute '!sleep 3; maim -s ' . a:name
endfunction
command! -nargs=* Scrshot call ScrshotFunc(<f-args>)

nmap ,sc yi[:Scrshot <C-R>+

" Latex stuff
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_quickfix = 3

imap <c-u> <Esc>viwUea
imap <c-l> <Esc>ysiw*Ea
imap <c-b> <Esc>ysiW*lysiW*Ea

" Helpful binds
nnoremap L $
onoremap L $
vnoremap L $
onoremap H 0
nnoremap H _
vnoremap H _
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
nnoremap Q @q
xnoremap <leader>c :!octave --silent \| cut -c8-<cr>
" vnoremap <leader>c :!octave --silent \| cut -c8-<cr>

" Set backup, undofile, and swapfile directory
set directory=~/.vim/swap
set backupdir=~/.vim/backup
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" smart home key
noremap <expr> <Home> (col('.') == matchend(getline('.'), '^\s*')+2 ? '0' : '^')
noremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$' : 'g_')
vnoremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$h' : 'g_')
imap <Home> <C-o><Home>
imap <End> <C-o><End>

" Map escape and leader
inoremap kj <ESC>
inoremap Kj <ESC>
inoremap KJ <ESC>
let mapleader = ","

" Hide buffers without being forced to save them
set hidden

" don't redraw during macro
set lazyredraw

" Binds for editing vimrc
:nnoremap <leader>ev :e $MYVIMRC<cr>
:nnoremap <leader>evv :vsplit $MYVIMRC<cr>
:nnoremap <leader>ehv :split $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" Changes tab completion method
set wildmode=longest,list,full
set wildmenu

" Always dispay status bar
set laststatus=2

" makes the system clipboard the default unnamed register
set clipboard=unnamedplus

" Makes Y consistent with other actions
" let g:yankstack_yank_keys = ['y', 'd', 'c']
" call yankstack#setup()
nnoremap Y y$


let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
autocmd FileType cpp let g:ycm_global_ycm_extra_conf = '~/.vim/YCM/.ycm_extra_conf_cpp.py'
autocmd FileType c let g:ycm_global_ycm_extra_conf = '~/.vim/YCM/.ycm_extra_conf_c.py'
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsEditSplit="vertical"

map <F9> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
let g:easytags_async=1

" Change what triggers semantic autocompletion
let g:ycm_semantic_triggers =  {
	\   'c' : ['->', '.'],
	\   'objc' : ['->', '.'],
	\   'ocaml' : ['.', '#'],
	\   'cpp,objcpp' : ['->', '.', '::'],
	\   'perl' : ['->'],
	\   'php' : ['->', '::'],
	\   'clojure' : ['(', ':'],
	\   'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
	\   'ruby' : ['.', '::'],
	\   'lua' : ['.', ':'],
	\   'erlang' : [':'],
	\ }

set foldmethod=indent  "fold based on indent
set foldnestmax=1      "deepest fold is 10 levels
set nofoldenable       "dont fold by default
set foldlevel=1        "this is just what i use

" Plugin mappings
let g:sneak#streak = 1
nnoremap <silent> <Leader>b :TagbarToggle<CR>
" nmap <leader>p <Plug>yankstack_substitute_older_paste
" nmap <leader>P <Plug>yankstack_substitute_newer_paste
"replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
"replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

" EasyAlign
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" unimpaired mappings
nmap <UP> [e
nmap <DOWN> ]e
vmap <UP> [egv
vmap <DOWN> ]egv
nmap <LEFT> [b
nmap <RIGHT> ]b

au BufNewFile,BufRead *.espeak set filetype=espeak
