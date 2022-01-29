"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath=&runtimepath
"source ~/.vimrc

set path+=**
set number
set mouse=a
set numberwidth=1
set clipboard^=unnamed,unnamedplus
syntax enable
set showcmd
set ruler
set encoding=UTF-8
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
set incsearch
set scrolloff=8
set updatetime=50
set shortmess+=c
set guifont=*

call plug#begin('~/.vim/plugged')

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/lsp_extensions.nvim'

"Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'nvim-lualine/lualine.nvim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'beyondwords/vim-twig'
Plug 'preservim/nerdcommenter'
Plug 'vuciv/vim-bujo'
" color scheme plugins
Plug 'gruvbox-community/gruvbox'
Plug 'EdenEast/nightfox.nvim'
Plug 'Xuyuanp/scrollbar.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'onsails/lspkind-nvim'
Plug 'wakatime/vim-wakatime'
" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" harpoon
Plug 'ThePrimeagen/harpoon'
" prettier
Plug 'sbdchd/neoformat'
" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'mfussenegger/nvim-dap'

" icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'yamatsum/nvim-nonicons'
Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

"set background=dark
"let g:gruvbox_contrast_dark='hard'
"let g:gruvbox_invert_selection='0'
"colorscheme gruvbox

" Tree opts
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }

lua require("mati")

let mapleader=" "

"let NERDTreeQuitOnOpen=1
"let NERDTreeShowHidden=1
"let g:NERDTreeIgnore = ['^node_modules$']

let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','
let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }

let g:mkdp_path_to_chrome = "/snap/bin/brave"

" switch between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap jj <Esc>
inoremap <c-c> <ESC>
 
nmap <leader>f :NvimTreeToggle<CR>
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

augroup ScrollbarInit
  autocmd!
  autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end

set t_RV=
