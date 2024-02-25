" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Disable type file detection. 
filetype off

" Load an indent file for the detected file type.
filetype indent on

" Enabel filetype plugin
filetype indent on
filetype plugin on

" turn sythax highlighting
syntax on

" highlight current line
set cursorline
highlight Cursorline cterm=bold ctermbg=black

" enable mouse support
set mouse=a

" set line number
set number

" relative line numbers
set relativenumber

" Prevent x and the delete key from overriding what's in the clipboard
noremap x "_x
noremap X "_x
noremap <Del> "_x

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" text wrap width
set textwidth=79

" backspace
set backspace=indent,eol,start

" linux system clipboard
set clipboard=unnamedplus,unnamed

" scrolling
set colorcolumn=80
set scrolloff=8

" dont redraw while executing macros
set lazyredraw

" save undo history even after closed the file
set undofile

" enable 256 colors palette in Gnone terminal
set t_Co=256
set t_ut=

" character encoding
set encoding=utf-8
set fileencoding=utf-8

" file format to unix
set fileformat=unix

" indentation using spaces
set tabstop=4                       " width of a tab character
set shiftwidth=4                    " whitespace to add in normal mode
set softtabstop=4                   " amount of whitespace to add
set smarttab						" smart when using tabs
set expandtab                       " when on use space instead of tabs 
set shiftround                      " 
set autoindent                      " autoindent in a new line

" show matching part of pairs (),{},[]
set showmatch

" make search smart 
set hlsearch                        " highlight search pattern
set incsearch                       " search like modern browsers
set ignorecase                      " ignore case when searching
set smartcase                       " smartcase search sensitivity

" clear highlighing after search
nnoremap <Leader><space> :noh<CR>

" Rebind <Leader> key
let mapleader = " "

" Set the commands to save in history default number is 20.
set history=10000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" Type ii to exit insert mode quickly.
inoremap ii <Esc>

" Plugins

" Specify a directory for plugins.
call plug#begin('~/.vim/plugged')

" vim theme.
Plug 'tomasiser/vim-code-dark'

" Toggle comments.
Plug 'tpope/vim-commentary'

" add/delete/change paranthesis
Plug 'tpope/vim-surround'

" Initialize plugin system
call plug#end()
colorscheme codedark
