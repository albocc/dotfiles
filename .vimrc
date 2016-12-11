" Make Vim more useful
set nocompatible

" Tabstop settings:
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
" Copy current indent when starting a new line
set autoindent
" Round indent to multiple of 'shiftwidth'.  Applies to > and < commands
set shiftround

" Activate syntax highlighting
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
	syntax on
endif

" Make invisible charaters visible
set listchars=eol:$,tab:»·,trail:·,extends:>,precedes:<
set list

" Look for modelines, that tell vim how to behave
set modeline

" Alow backspace in insert mode and make it continue on previous line
set backspace=indent,eol,start

" Remember command history of 50 entries (default)
set history=50

" Put a line at the bottom of the window to show cursor position
set ruler

" Show last command or mode (insert, visual, etc) in last line
set showcmd
set showmode

" Set textwidth to break lines longer than that
set textwidth=80

" Detect Unix (LF) or Windows (CR) line endings
set fileformats=unix,dos

" Set the title of the window, taken from vim help
:set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

" Enhanve command-line completion
set wildmenu
" Files to ignore when auto-completing
set wildignore=*.o,*~
set wildignore+=*DS_Store*
set wildignore+=*.png,*.jpg,*.gif

" Allow cursor keys in insert mode
set esckeys

" Use UTF-8 without byte order mark (BOM), since it can cause trouble
set encoding=utf-8 nobomb

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don't wrap long lines, let them run off screen instead
set nowrap

" Start scrolling three/ten lines before the horizontal/vertical window border
set scrolloff=3
set sidescrolloff=10
set sidescroll=1

" Search
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" Show line numbers
set number

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

