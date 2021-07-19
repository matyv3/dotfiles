
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>td :lua require('telescope.builtin').grep_string({ search = "TODO" })<CR>

nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nmap <silent> pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>rc :lua require('mati.telescope').search_dotfiles()<CR>
