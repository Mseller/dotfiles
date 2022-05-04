"-------------------------------------------------------------------------
" General Settings
"-------------------------------------------------------------------------

set shiftwidth=4
set tabstop=4
set hidden
set relativenumber
set number
set termguicolors
set spell
set title
set ignorecase
set list
set clipboard+=unnamedplus
set syntax=enable

"-------------------------------------------------------------------------
" Key maps
"-------------------------------------------------------------------------

let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vm<cr>
nmap <leader>vs :source ~/.config/nvim/init.vim<cr>

map gf :edit <cfile><cr>

nnoremap <Leader>w :call mkdir(expand("%:p:h"), "p")<CR>

"-------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/nerdtree.vim

call plug#end()
doautocmd User PlugLoaded
