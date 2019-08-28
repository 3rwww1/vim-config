set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
call vundle#end()
syntax on
filetype plugin indent on
let g:airline_powerline_fonts = 1
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set number
set ignorecase
set noswapfile
set mouse=a
set background=dark
colorscheme gruvbox
