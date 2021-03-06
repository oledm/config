set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'sheerun/vim-polyglot'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'Raimondi/delimitMate'
Plugin 'mileszs/ack.vim'
Plugin 'elzr/vim-json'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'
Plugin 'guns/vim-clojure-static'
Plugin 'vim-scripts/paredit.vim'
Plugin 'luochen1990/rainbow'
Plugin 'lifepillar/vim-solarized8'
Plugin 'morhetz/gruvbox'

call vundle#end()            " required

filetype plugin indent on    " required

set background=dark
colorscheme solarized8_dark
"colorscheme gruvbox
"let g:gruvbox_contrast_dark='medium'
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
let g:ackprg = 'ag --nogroup --nocolor --column --smart-case --ignore-dir=node_modules --ignore-dir=lib --ignore-dir=dist'

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

let g:rainbow_active = 0
let g:rainbow_operators = 1
	let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['brown', 'Darkblue', 'darkgray', 'darkgreen', 'darkcyan', 'darkred', 'darkmagenta', 'brown', 'gray', 'black', 'darkmagenta', 'Darkblue', 'darkgreen', 'darkcyan', 'darkred', 'red'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

let g:NERDTreeWinSize=40
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|.git\|jspm_packages\|bower_components\|lib'
let g:ycm_server_python_interpreter='/usr/bin/python2.7'
"let g:ctrlp_cmd = 'CtrlPBuffer'
let delimitMate_expand_cr = 2
set laststatus=2
" настройки Vim-Airline
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#tab_nr_type = 1 " tab number"
"let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:used_javascript_libs = 'underscore,react'



let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"vnoremap <silent> y y`] 
"vnoremap <silent> p p`] 
"nnoremap <silent> p p`] 

function! ConfirmQuit(writeFile)
    if (a:writeFile)
        if (expand('%:t')=="")
            echo "Can't save a file with no name."
            return
        endif
        :write
    endif

    if (winnr('$')==1 && tabpagenr('$')==1)
        if (confirm("Do you really want to quit?", "&Yes\n&No", 2)==1)
            :quit
        endif
    else
        :quit
    endif
endfu


set ttimeoutlen=50
set hidden
set confirm
syntax enable
syn on
set number
set noshowmode
set showcmd

"map <Tab> <Esc><C-w>w
imap <F1> <Esc>:NERDTreeToggle<CR>
map <F1> <Esc>:NERDTreeToggle<CR>
imap <F2> <Esc>:w<CR>
map <F2> <Esc>:w<CR>
imap <F3> <Esc>:bp <BAR> bd #<CR>
map <F3> <Esc>:bp <BAR> bd #<CR>
imap <F4> <Esc>:qall<cr>
map <F4> <Esc>:qall<cr>
map <C-Right> :bn<CR>
map <C-Left> :bp<CR>
map <C-Up> gg
map <C-Down> G
map <CR> G
map <BS> gg
nnoremap <C-j> :bp<CR>
nnoremap <C-k> :bn<CR>
nnoremap <C-c><C-x> :Require!<CR>
map <Space> <Leader>
map <Leader>c :s/^/\/\//<CR>:nohlsearch<CR>
map <Leader>x :s/^\/\///<CR>:nohlsearch<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
nnoremap <Leader>p :e#<CR>
nnoremap <Leader>$ :blast<CR>
nnoremap <Leader>^ :bfirst<CR>
nnoremap <Leader>l :setlocal number!<CR>
nnoremap <Leader>o :CtrlPBuffer<CR>
nmap <leader>t :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>
map - ddp
map _ ddkP
noremap 0 ^
noremap ^ 0

set incsearch
":set noequalalways
":set winminheight=0
":set winheight=9999
":set ts=4
":set expandtab
":set shiftwidth=4
":set linebreak
":set dy=lastline
set autoindent shiftwidth=4
set fileencodings=ucs−bom,utf−8,cp1251,koi8-r
set dir=/tmp/
"игноррируемые NERDTreeToggle файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
"filetype plugin on

" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
"set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
"set confirm
"set autowriteall

" Better command-line completion
set wildmenu
set wildignore=*.o,*~,*.pyc

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
"set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
"set laststatus=1

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
"set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=1

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
"map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


"------------------------------------------------------------
set so=7

" Set to auto read when a file is changed from the outside
set autoread
"
" " With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
"let mapleader = ","
"let g:mapleader = ","
"nmap <leader>w :w!<cr>
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk
nnoremap <Up> g<Up>
nnoremap <Down> g<Down>
"map y <Plug>(operator-flashy)
"nmap Y <Plug>(operator-flashy)$
