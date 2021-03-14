  
set number
set mouse=a
set numberwidth=1
set clipboard+=unnamedplus
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

set completeopt=menuone,noinsert,noselect


call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'beyondwords/vim-twig'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdcommenter'
" color scheme plugins
Plug 'morhetz/gruvbox'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'jiangmiao/auto-pairs'
Plug 'flazz/vim-colorschemes'
Plug 'wakatime/vim-wakatime'
" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" prettier
Plug 'sbdchd/neoformat'

call plug#end()

set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

let mapleader=" "
let g:airline#extensions#tabline#enabled = 1
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['^node_modules$']
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','

" lsp
let g:completion_matching_strategy_list = ['exact','substring','fuzzy']
lua require('lspconfig').tsserver.setup{ on_attach=require('completion').on_attach }

inoremap jj <Esc>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>q :bd<CR>
nmap <leader>w :w<CR>
nmap <leader>s :Files<CR>

nmap <leader>l :bnext<CR>
nmap <leader>h :bprev<CR>

nmap <leader>t :terminal<CR>

"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"noremap <leader>gs :CocSearch

" replaces gs
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nmap <silent> gd :lua vim.lsp.buf.definition()<CR>
nmap <silent> gi :lua vim.lsp.buf.implementation()<CR>
nmap <silent> pf :lua require('telescope.builtin').find_files()<CR>


augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
