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
set ruler	    	" show the cursor position all the time
set showcmd	    	" display incomplete commands
set incsearch		" do incremental searching
set number	    	" line numbers
syntax on	    	" syntax highlighting

set wildignore+=*.o,*.swp,*/tmp/*,*.bak,*.zip  

" Custom keybindings
map <C-t> :NERDTreeToggle<CR>

" Plugin Settings
let g:multi_cursor_next_key='<C-d>'
let NERDTreeIgnore = ['\.o$','\.bak$']

" Tab Settings
set tabstop=4		" existing tab is 4 spaces width
set shiftwidth=4	" indenting with '>' inserts 4 spaces
set expandtab		" tab indents 4 spaces

" Theme settings
" set background=dark
colorscheme molokai 
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
call vundle#end()
filetype plugin indent on    " required
