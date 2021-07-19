
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

set completeopt=menuone,noinsert,noselect

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
" color scheme plugins
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'flazz/vim-colorschemes'
Plug 'wakatime/vim-wakatime'
Plug 'ghifarit53/tokyonight-vim'
" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
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

call plug#end()

set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

"let g:tokyonight_style = 'night'
"colorscheme tokyonight

let mapleader=" "
let g:airline#extensions#tabline#enabled = 1
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['^node_modules$']
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','

" lsp
let g:completion_matching_strategy_list = ['exact','substring','fuzzy']
lua << EOF
	require'lspconfig'.tsserver.setup{ on_attach=require('completion').on_attach }
	require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
EOF

" === vim-jsx === "
" Highlight jsx syntax even in non .jsx files
let g:jsx_ext_required = 0

inoremap jj <Esc>
inoremap <c-c> <ESC>
 
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>q :bd<CR>
nmap <leader>w :w<CR>
nmap <leader>s :Files<CR>

nmap <leader>l :bnext<CR>
nmap <leader>h :bprev<CR>

nmap <leader>t :terminal<CR>

" replaces gs
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>td :lua require('telescope.builtin').grep_string({ search = "TODO" })<CR>

nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nmap <silent> gd :lua vim.lsp.buf.definition()<CR>
nmap <silent> gi :lua vim.lsp.buf.implementation()<CR>
nmap <silent> pf :lua require('telescope.builtin').find_files()<CR>

nmap <leader>nf :Neoformat<CR>
" auto format
"augroup fmt
  "autocmd!
  "autocmd BufWritePre * undojoin | Neoformat
"augroup END
