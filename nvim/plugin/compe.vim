set completeopt=menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
inoremap <silent><expr> <CR>      compe#confirm('<CR>')

