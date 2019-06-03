set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
  set backupext=.bak
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set number		" line numbers
syntax on		" syntax highlighting
set encoding=utf-8

set tabstop=4		" existing tab is 4 spaces width
set shiftwidth=4	" indenting with '>' inserts 4 spaces
set expandtab		" tab indents 4 spaces

set wildignore+=*.o,*.swp,*/tmp/*,*.bak,*.zip  
map <C-t> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.o$','\.bak$']
let g:multi_cursor_next_key='<C-d>'

set mouse=a
" Theme settings
set background=dark
" colorscheme molokai 
let g:solarized_termcolors=256
colorscheme solarized
set t_Co=256

" Vundle Settings
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
" Plugin 'terryma/vim-multiple-cursors'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()
filetype plugin indent on    " required
