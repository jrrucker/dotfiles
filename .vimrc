set nocompatible              " be iMproved, required
filetype off                  " required

let mapleader=","				" Change mapleader

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'notpratheek/vim-luna'
call vundle#end()

filetype plugin indent on    " required

" colorscheme
try
    colorscheme luna
catch
endtry

" Toggle NERDTree
nmap <leader>; :NERDTreeToggle<cr>
let NERDTreeShowBookmarks = 1

" Airline Options
let g:airline_theme='luna'
let g:airline_powerline_fonts=1
set guifont=Inconsolata\ for\ Powerline
set t_Co=256

" General VIM settings
set clipboard=unnamed   		" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set wildmenu            		" Enhance command-line completion
set esckeys             		" Allow cursor keys in insert mode
set backspace=indent,eol,start 	" Allow backspace in insert mode
set ttyfast						" Optimize for fast terminal connections
set gdefault					" Add the g flag to search/replace by default
set encoding=utf-8 nobomb		" Use UTF-8 without BOM

set binary						" Don’t add empty newlines at the end of files
set noeol 						" Centralize backups, swapfiles and undo history

set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
set exrc						" Enable per-directory .vimrc files and disable unsafe commands in them
set secure
" set numbers 					" Enable line numbers
syntax on 						" Enable syntax highlighting
" set cursorline 					" Highlight current line
set tabstop=2					" Make tabs as wide as two spaces
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_ 	" Show “invisible” characters
set list
set hlsearch 					" Highlight searches
set ignorecase					" Ignore case of searches
set incsearch					" Highlight dynamically as pattern is typed
set laststatus=2				" Always show status line
set mouse=a 					" Enable mouse in all modes
set noerrorbells 				" Disable error bells
set nostartofline 				" Don’t reset cursor to start of line when moving around.
set ruler 						" Show the cursor position
set shortmess=atI 				" Don’t show the intro message when starting Vim
set showmode 					" Show the current mode
set title 						" Show the filename in the window titlebar
set showcmd 					" Show the (partial) command as it’s being typed

" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif
