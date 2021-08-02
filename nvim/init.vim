set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
"source ~/.vimrc

set path+=**
set number
set mouse=a
set numberwidth=1
set clipboard^=unnamed,unnamedplus
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
set encoding=UTF-8
set tabstop=4 softtabstop=4
set shiftwidth=4
set nohlsearch
set hidden
set noerrorbells
set smartcase
set scrolloff=8
set updatetime=50
set shortmess+=c

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'beyondwords/vim-twig'
Plug 'preservim/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vuciv/vim-bujo'
" color scheme plugins
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'flazz/vim-colorschemes'
Plug 'wakatime/vim-wakatime'
" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" prettier
Plug 'sbdchd/neoformat'
" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()

set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

"let g:tokyonight_style = 'night'
"colorscheme tokyonight

lua require("mati")

let mapleader=" "
let g:airline#extensions#tabline#enabled = 1
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['^node_modules$']
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','
let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap jj <Esc>
inoremap <c-c> <ESC>
 
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>q :bd<CR>
nmap <leader>w :w<CR>
nmap <leader>s :Files<CR>

nmap <leader>l :bnext<CR>
nmap <leader>h :bprev<CR>

nmap <leader>nf :Neoformat<CR>

nnoremap <leader>gg :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>

" TODO list
nmap <C-S> <Plug>BujoAddnormal
imap <C-S> <Plug>BujoAddinsert


" awesome remaps
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
inoremap <leader>k :m .-2<CR>==
inoremap <leader>j :m .+1<CR>==

nnoremap Y y$

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
