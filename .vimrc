set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on     " required

" =============================================================================================
" general settings ============================================================================
" =============================================================================================

let mapleader=","               " Change mapleader

set clipboard=unnamed           " Use the OS clipboard
set wildmenu                    " Enhance command-line completion
set esckeys                     " Allow cursor keys in insert mode
set backspace=indent,eol,start  " Allow backspace in insert mode
set ttyfast                     " Optimize for fast terminal connections
set gdefault                    " Add the g flag to search/replace by default
set encoding=utf-8 nobomb       " Use UTF-8 without BOM
set binary                      " Don’t add empty newlines at the end of files
set noeol                       " Centralize backups, swapfiles and undo history

syntax on                       " Enable syntax highlighting
set autoread                    " Autoread file when change externally
set modeline                    " Respect modeline in files
set modelines=4
set exrc                        " Enable per-directory .vimrc files and disable unsafe commands in them
set secure
set number                      " Enable line numbers
set tabstop=4                   " Make tabs as wide as two spaces
set shiftwidth=4
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_    " Show “invisible” characters
set list
set hlsearch                    " Highlight searches
set ignorecase                  " Ignore case of searches
set incsearch                   " Highlight dynamically as pattern is typed
set laststatus=2                " Always show status line
set mouse=a                     " Enable mouse in all modes
set noerrorbells                " Disable error bells
set nostartofline               " Don’t reset cursor to start of line when moving around.
set shortmess=atI               " Don’t show the intro message when starting Vim
set showmode                    " Show the current mode
set title                       " Show the filename in the window titlebar
set showcmd                     " Show the (partial) command as it’s being typed

" Start scrolling three lines before the horizontal window border
set scrolloff=3

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/bower_components/*,*/node_modules/*,*/functional-test/*,*/response-management-agent-tests/*

" =============================================================================================
" command mappings ============================================================================
" =============================================================================================

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

" Fast saving & exit
nmap <leader>w :w!<cr>
nmap <leader>x :x!<cr>
nmap <leader>q :q<cr>

nnoremap <silent> <leader>, :nohl<cr>
map <leader><tab> :tabn<cr>
map <leader><esc> :tabp<cr>
nnoremap <leader><space> :Ag<space>

" =============================================================================================
" vundle plugins ==============================================================================
" =============================================================================================

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'rking/ag.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'christoomey/vim-tmux-navigator'
call vundle#end()

" =============================================================================================
" plugin options ==============================================================================
" =============================================================================================

" airline
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1

" nerdtree
nmap <leader>; :NERDTreeToggle<cr>
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let g:NERDTreeIgnore=['bower_components', 'node_modules', '.git', 'functional-test', 'dist', 'response-management-agent-tests', '.sass-cache']

" syntastic
let g:syntastic_check_on_open=1          " Run syntax checks on file open
let g:syntastic_error_symbol='✗'         " Set syntax check symbols
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_highlighting = 0  " Turn off error highlighting, symbols are plenty
let g:syntastic_javascript_checkers = ['jshint', 'jscs']    " Set languange checker

" ctrlp
let g:ctrlp_custom_ignore = {
  \  'dir': '\v[\/]\.(git|hg|svn|node_modules|.sass-cache|bower_components|dist|functional-test|response-management-agent-tests)$'
  \  }

" =============================================================================================
" display settings  ===========================================================================
" =============================================================================================

" colorscheme
syntax enable
set background=dark
colorscheme solarized

let g:solarized_termcolors=256

set background=dark
set cursorline

set guifont=Inconsolata\ for\ Powerline   " installed from https://github.com/powerline/fonts
set t_Co=256                              " enable 256 colors
set ruler                                 " Show the cursor position

au BufReadPost *.hbs set syntax=mustache
au BufReadPost Jenkinsfile set syntax=groovy

" =============================================================================================
" temporary stuff =============================================================================
" =============================================================================================

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" disable mouse scroll
autocmd BufEnter * set mouse=
