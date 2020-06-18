
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode
set backspace=2
set termguicolors

call plug#begin('~/.vim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'leafgarland/typescript-vim'
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'beyondwords/vim-twig'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" color scheme plugins
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'

call plug#end()

let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material
set background=dark

let mapleader=" "
let g:airline#extensions#tabline#enabled = 1
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let g:prettier#autoformat = 1
nmap <leader>e <Plug>(easymotion-s2)
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :bnext<CR>
nmap <leader>w :bd<CR>
nmap <leader>s :Files<CR>
