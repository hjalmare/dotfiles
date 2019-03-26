set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'junegunn/vim-easy-align'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'flazz/vim-colorschemes'
  Plugin 'guns/vim-sexp'
  Plugin 'tpope/vim-fireplace'
  Plugin 'tpope/vim-fugitive' 
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'rhysd/vim-crystal'
  Plugin 'rhysd/vim-llvm'
  Plugin 'rust-lang/rust.vim'
  Plugin 'leafgarland/typescript-vim'
  " All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required


" ---------------
" Color
" ---------------
set background=dark
colorscheme jellybeans
" Force 256 color mode if available
if $TERM =~ '-256color'
  set t_Co=256
endif

" -----------------------------
" File Locations
" -----------------------------
" Double // causes backups to use full file path
"exec 'set backupdir=' . g:vimdir . '/.backup//'
"exec 'set directory=' . g:vimdir . '/.tmp//'
"exec 'set spellfile=' . g:vimdir . '/spell/custom.en.utf-8.add'
" Persistent Undo
"if has('persistent_undo')
"  set undofile
"  exec 'set undodir=' . g:vimdir . '/.undo'
"endif

set noswapfile
set nobackup
set nowritebackup


" ---------------
" UI
" ---------------
set ruler          " Ruler on
set number         " Line numbers on
set nowrap         " Line wrapping off
set laststatus=2   " Always show the statusline
set cmdheight=2    " Make the command area two lines high
set cursorline     " Highlight current line
set encoding=utf-8
set noshowmode     " Don't show the mode since Powerline shows it
set title          " Set the title of the window in the terminal to
                   " the file
if exists('+colorcolumn')
  set colorcolumn=80  " Color the 80th column differently as a
                      " wrapping guide.
endif

" Disable tooltips for hovering keywords in Vim
if exists('+ballooneval')
  " This doesn't seem to stop tooltips for Ruby files
  set noballooneval
  " 100 second delay seems to be the only way to disable the
  " tooltips
  set balloondelay=100000
endif

" ---------------
" Behaviors
" ---------------
syntax enable
set autoread           " Automatically reload changes if
                        "detected
set wildmenu           " Turn on WiLd menu
                       " longest common part, then all.
set wildmode=longest,full
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in
                       " history.
set confirm            " Enable error files & error jumping.
set clipboard=unnamedplus " Yanks go on clipboard instead.
set autowrite          " Writes on make/shell commands
set timeoutlen=400     " Time to wait for a command (after
                       " leader for example).
set ttimeout
set ttimeoutlen=100    " Time to wait for a key sequence.
set nofoldenable       " Disable folding entirely.
set foldlevelstart=99  " I really don't like folds.
set formatoptions=crql
set iskeyword+=\$,-    " Add extra characters that are
                       " valid parts of variables
set nostartofline      " Don't go to the start of the line
                       " after some commands
set scrolloff=3        " Keep three lines below the last
                       " line when scrolling
set gdefault           " this makes search/replace global
                       " by default
set switchbuf=useopen  " Switch to an existing buffer if
                       " one exists
" ---------------
" Text Format
" ---------------
set tabstop=2
set backspace=indent,eol,start " Delete everything with
                               " backspace
set shiftwidth=2               " Tabs under smart indent
set shiftround
set cindent
set autoindent
set smarttab
set expandtab

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch  " Incremental search
set hlsearch   " Highlight search results
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,
\.sass-cache,*.class,*.scssc,*.cssc,sprockets%*,*.lessc,*/node_modules/*,
\rake-pipeline-*

" ---------------
" Visual
" ---------------
set showmatch   " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink
                " Show invisible characters
set list

" Show trailing spaces as dots and carrots for
" extended lines.
" From Janus, http://git.io/PLbAlw

" Reset the listchars
set listchars=""
" make tabs visible
set listchars=tab:▸▸
" show trailing spaces as dots
set listchars+=trail:•
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=extends:>
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=precedes:<

" " ---------------
" " Sounds
" " ---------------
set noerrorbells
set novisualbell
set t_vb=
"
" " ---------------
" " Mouse
" " ---------------
set mousehide  " Hide mouse after chars typed
set mouse=a    " Mouse in all modes
"
" " Better complete options to speed it up
set complete=.,w,b,u,U

" use , as <leader>
let mapleader = ","
let maplocalleader = "-"

" Easy align bindings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"Disable autoformat when pasting
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

