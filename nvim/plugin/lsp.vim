
nmap <silent> gd :lua vim.lsp.buf.definition()<CR>
nmap <silent> gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>sh :lua vim.lsp.buf.signature_help()<CR>

