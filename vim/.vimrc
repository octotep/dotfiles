" octotep's .vimrc - steal to your hearts content

" First time set up {{{
" =================

" Create directories {{{
if !isdirectory("$HOME/.vim/backup")
	call mkdir("$HOME/.vim/backup", "p")
endif
if !isdirectory("$HOME/.vim/sessions")
	call mkdir("$HOME/.vim/sessions", "p")
endif
if !isdirectory("$HOME/.vim/swap")
	call mkdir("$HOME/.vim/swap", "p")
endif
if !isdirectory("$HOME/.vim/undo")
	call mkdir("$HOME/.vim/undo", "p")
endif
"}}}

"}}}

" Plugins {{{
" =======

" Install vim-plug if it doesn't exist {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
"}}}

" Init vim-plug
call plug#begin('~/.vim/bundle')

" Misc stuff {{{
" ----------
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'terryma/vim-multiple-cursors'
Plug 'bling/vim-airline'
Plug 'dhruvasagar/vim-table-mode'
Plug 'Raimondi/delimitMate'
Plug 'mbbill/undotree'
Plug 'chrisbra/NrrwRgn'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/syntastic'
Plug 'farseer90718/vim-taskwarrior'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-sleuth'
Plug 'takac/vim-hardtime'
Plug 'EinfachToll/DidYouMean'
Plug 'maxbrunsfeld/vim-yankstack'
" Plug 'vasconcelloslf/vim-interestingwords'
"}}}

" Tmux stuff {{{
" ----------
Plug 'christoomey/vim-tmux-navigator'
"}}}

" Custom text objects {{{
" -------------------
Plug 'kana/vim-textobj-user'
Plug 'Julian/vim-textobj-brace'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'sgur/vim-textobj-parameter'
Plug 'kana/vim-textobj-syntax'
Plug 'rbonvall/vim-textobj-latex', { 'for': ['tex', 'latex'] }
Plug 'coderifous/textobj-word-column.vim'
"}}}

" Custom motions {{{
" --------------
Plug 'bruno-/vim-vertical-move'
"}}}

" Custom operators {{{
" ----------------
Plug 'justinmk/vim-sneak'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'tommcdo/vim-exchange'
"}}}

" Searching {{{
" ---------
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'mileszs/ack.vim'
Plug 'Shougo/unite.vim'
"}}}

" Version Control {{{
" ---------------
Plug 'tpope/vim-fugitive'
"}}}

" C/C++ {{{
" -----
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
"}}}

" C Sharp {{{
" -------
Plug 'OmniSharp/omnisharp-vim'
"}}}

" XML {{{
" ---
Plug 'rstacruz/sparkup', { 'for': ['xhtml', 'html', 'xml'] }
"}}}

" Complicated stuff {{{
" -----------------
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --system-libclang --omnisharp-completer' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
"}}}

" Clojure stuff {{{
" -------------
Plug 'luochen1990/rainbow'
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'tpope/vim-leiningen', { 'for': 'clojure' }
"}}}

" Haskell {{{
" -------
Plug 'raichoo/haskell-vim', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
" Plug 'enomsg/vim-haskellConcealPlus'
"}}}

" Go stuff {{{
" --------
Plug 'fatih/vim-go'
"}}}

" Colorscheme {{{
" -----------
Plug 'altercation/vim-colors-solarized'
Plug 'jnurmine/Zenburn'
Plug 'jaxbot/semantic-highlight.vim'
"}}}

" Note taking stuff {{{
" -----------------
Plug 'LaTeX-Box-Team/LaTeX-Box', { 'for': ['latex', 'tex'] }
Plug 'tpope/vim-markdown', { 'for': ['markdown', 'mkd'] }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': ['markdown', 'pandoc'] }
Plug 'vim-pandoc/vim-pandoc', { 'for': ['pandoc', 'markdown'] }
Plug 'vimwiki/vimwiki'
"}}}

" end vim-plug
call plug#end()
"}}}

" Options {{{
" =======

" Important {{{
" ---------
set nocompatible           " Makes vim incompatible with vi (and unlocks tons of
                           "   functionality)
filetype plugin indent on  " Nice, plus necessary for most plugins
"}}}

" Moving Around, Searching and Patterns {{{
" -------------------------------------
set incsearch   " Jump to next match while searching
set ignorecase  " Ignore case when searching (can override with /\Csearchterm)
set smartcase   " Overriders ignorecase when search contains capital letters
"}}}

" Tags {{{
" ----
"}}}

" Displaying Text {{{
" ---------------
set scrolloff=5      " Keep some lines before or after the cursor for context
set sidescrolloff=5  " Keep some columns before or after the cursor for context
set wrap             " Wrap long lines
set linebreak        " break wrapped lines at word boundraries
set breakindent      " Preserve indent when wrapping lines
set showbreak=\ \    " Add two spaces at the beginning of breakindented lines
set lazyredraw       " Don't redraw during macro
set number           " Show line numbers
set relativenumber   " Use relative line numbering
"}}}

" Syntax, Highlighting and Spelling {{{
" ---------------------------------
syntax on            " Turn syntax highlighting on
set background=dark  " Use the dark colorscheme
set hlsearch         " Highlight search terms
set cursorline       " Highlight the line which the cursor is on
set t_ut=            " Clears using the current background color
set t_Co=256         " Sets the number of colors
colors zenburn       " Set the colorscheme to zenburn
" colorscheme solarized
"}}}

" Multiple Windows {{{
" ----------------
set laststatus=2  " Always dispay status bar
set hidden        " Hide buffers without being forced to save them
"}}}

" Multiple Tab Pages {{{
" ------------------
"}}}

" Terminal {{{
" --------
"}}}

" Using the Mouse {{{
" ---------------
set mouse=a
"}}}

" Printing {{{
" --------
"}}}

" Messages and Info {{{
" -----------------
"}}}

" Selecting Text {{{
" --------------
set clipboard=unnamedplus  " makes the system clipboard the default unnamed register
"}}}

" Editing Text {{{
" ------------
set undofile                 " Store undo history in a file (persistent undo)
set undodir=$home/.vim/undo  " Set the undo directory
set undolevels=1000          " max number of changes which can be undone
set undoreload=10000         " max number of lines to save for undo on a buffer reload
set backspace=2              " Backspace over old text, across lines, etc.
"}}}

" Tabs and Indenting {{{
" ------------------
" Set shiftwidth, the number of spaces used for each (auto)indent
try
  set shiftwidth=0 " make 'shiftwidth' use the value of 'tabstop'
catch /^Vim\%((\a\+)\)\=:E487/ " before Vim 7.4, Vim did not support the value 0
  set shiftwidth=4
endtry
" Set softtabstop, the number of spaces to insert for a <Tab>
try
	set softtabstop=-1 " make 'softtabstop' use the value of 'shiftwidth'
catch /^Vim\%((\a\+)\)\=:E487/ " before Vim 7.4, Vim did not support the value -1
	set softtabstop=4
endtry
set tabstop=4    " The number of spaces a <Tab> stands for in the text
set noexpandtab  " Don't expand tabs to spaces, change this by filetype if needed
set autoindent   " Automatically set the indent of a new line
"}}}

" Folding {{{
" -------
set nofoldenable
set foldmethod=indent  " The default fold mode will be indent
set foldnestmax=10     " The maximum fold depth
set foldlevel=1        " folds with a level highter than this number will be closed
set foldlevelstart=1   " value for 'foldlevel' when starting to edit a file
set foldopen=hor,mark,percent,quickfix,search,tag,undo  " Controls when folds open
set foldclose=all      " Closes a fold when the cursor leaves it
"}}}

" Diff Mode {{{
" ---------
"}}}

" Mapping {{{
" -------
set timeout          " Time out halfway into a mapping
set nottimeout       " Don't time out halfway into a key code
set timeoutlen=1000  " time for timeout
set ttimeoutlen=100  " time for ttimeout
"}}}

" Reading and Writing Files {{{
" -------------------------
set backup                   " keep a backup file after overwriting a file
set writebackup              " Write backup file before overwriting a file
set backupdir=~/.vim/backup  " Set the backup file directory
set autoread                 " Automatically read a file when it was modified outside of Vim
"}}}

" The Swap File {{{
" -------------
set directory=~/.vim/swap  " Set the swapfile directory, don't litter where we work
"}}}

" Command Line Editing {{{
" --------------------
set wildmode=longest,list,full  " Specifies how commandline completion works
set wildmenu                    " Show possible completions in a menu
set cmdwinheight=5              " Shrink the height of the cmd window
"}}}

" Executing External Commands {{{
" ---------------------------
" TODO: use par if available as formatprg
"}}}

" Running Make and Jumping to Errors {{{
" ----------------------------------
"}}}

" Language Specific {{{
" -----------------
"}}}

" Multi-byte Characters {{{
" ---------------------
set encoding=utf-8  " Set the character encoding
"}}}

" Various {{{
" -------
set guioptions-=T  " Removes the toolbar from gVim
"}}}
"}}}

" Custom functions {{{
" ================

" Taking screenshots with maim {{{
" ----------------------------
function! ScrshotFunc(name)
	execute '!sleep 3; maim -s ' . a:name
endfunction
command! -nargs=* Scrshot call ScrshotFunc(<f-args>)
"}}}

" FZF helpers {{{
" -----------
" These were copied from the FZF wiki
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction
"}}}

"}}}

" Plugin Options and Mappings {{{
" ===========================

" Overwriting the defaults {{{
" ------------------------
command! WQ wq  " Maps for a quick wq
command! Wq wq
command! W w
command! Q q
" Use H and L to go to the beginning and end of the line
nnoremap L $
onoremap L $
vnoremap L $
onoremap H 0
nnoremap H _
vnoremap H _
" Use Q to play the macro in the q register
nnoremap Q @q
vnoremap Q :norm @q<cr>
" Map escape to kj
inoremap kj <esc>
inoremap Kj <ESC>
inoremap KJ <ESC>
" Make Y mapping consistent with other defaults
nnoremap Y y$
" Increase horizontal scroll distance
nnoremap zl 20zl
nnoremap zh 20zh
"}}}

" Leader mappings {{{
" ---------------
let mapleader = "\<space>"
" Quick save
nnoremap <leader>w :w<cr>
" Edit .vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>evv :vsplit $MYVIMRC<cr>
nnoremap <leader>ehv :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" Enter a normal command over a visual selection easily
vnoremap <leader><leader> :norm
" Strip trailing whitespace
nnoremap <Leader>stw :%s/\v\s+$//e<CR>
" Condense consecutive blank lines
nnoremap <Leader>cbl :%s/\v\n{3,}/\r\r/e<CR>
" Take a screenshot and title the file the current word in []
nmap <leader>sc yi[:Scrshot <C-R>+
"}}}

" Map Command Mode {{{
" ----------------
" Make <enter> the new colon
nnoremap <CR> :
" Make colon open the command line window (in insert mode)
nnoremap : q:i
" Make <leader><enter> execute the current command in the command line window
augroup commandmode
	autocmd!
	autocmd CmdwinEnter * nnoremap <buffer> <leader><CR> <CR>
augroup END
"}}}

" Helpful Binds {{{
" -------------
" Save as root using sudo
cmap w!! w !sudo tee > /dev/null %
" Evaluate current line in octave
xnoremap <leader>c :!octave --silent \| cut -c8-<cr>
" Redraw the screen with a leader mapping
nnoremap <leader>r :redraw!<cr>
" delete the current buffer, but keep the split
nnoremap <silent> <leader>bd :bp\|bd #<CR>
"}}}

" Function Keys {{{
" -------------
" Run the buffer through xmllint
nnoremap <F6> :%!xmllint --format -
nnoremap <silent> <F8> :TagbarToggle<CR>
"}}}

" Insert mode mappings {{{
" --------------------
" Uppercase the last word
imap <c-u> <Esc>viwUea
" Underline the last word (markdown syntax)
imap <c-l> <Esc>ysiw*Ea
" Bold the last word (markdown syntax)
imap <c-b> <Esc>ysiW*lysiW*Ea
"}}}

" FZF functions and mappings {{{
" --------------------------

" Fuzzy open a file
nnoremap <leader>fo :FZF -m<cr>
" Fuzzy open a buffer
nnoremap <silent> <Leader>fb :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
"}}}

" EasyAlign {{{
" ---------
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"}}}

" Vimwiki {{{
" -------
" Remap keys because of my <leader> mapping as <space>
nmap <leader><cr> <Plug>VimwikiFollowLink
nmap <leader><space> <Plug>VimwikiToggleListItem
"}}}

" Unimpaired mappings {{{
" -------------------
nmap <UP> [e
nmap <DOWN> ]e
vmap <UP> [egv
vmap <DOWN> ]egv
nmap <LEFT> [b
nmap <RIGHT> ]b
"}}}

" Vim-Airline {{{
" -----------
" Algo 2 works well with tabs for indent, space for alignment
let g:airline#extensions#whitespace#mixed_indent_algo = 2
" Enable the tabline and set basic characters
let g:airline#extensions#tabline#enabled = 1
" Use the powerline fonts
let g:airline_powerline_fonts = 1
"}}}

" Incsearch-vim {{{
" -------------
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" TODO: create a toggle mapping for this, sometimes it's nice
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
"}}}

" vim-sneek {{{
" ---------
" Enable streak mode, quit with <space>
let g:sneak#streak = 1
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
"}}}

" YouCompleteMe {{{
" Set the default ycm config as a backup
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
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
"}}}

" vim-go {{{
" ------
let g:go_fmt_command = "goimports"
"}}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsEditSplit="horizontal"
"}}}

" Ack.vim {{{
" -------
" let g:ack_use_dispatch = 1
" Use ag if possible
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
"}}}

" vim-hardtime {{{
" ------------
let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+"]
let g:list_of_insert_keys = []
" let g:hardtime_default_on = 1
"}}}

" RainbowParaenthesis {{{
" -------------------
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
"}}}

" Interesting-words {{{
" -----------------
" nnoremap <silent> <leader>n :call WordNavigation('forward')<cr>
" nnoremap <silent> <leader>N :call WordNavigation('backward')<cr>
"}}}

" Yankstack {{{
" ---------
" nmap <leader>p <Plug>yankstack_substitute_older_paste
" nmap <leader>P <Plug>yankstack_substitute_newer_paste
"}}}

"}}}

" vim:fdm=marker:foldlevelstart=0:foldlevel=0
