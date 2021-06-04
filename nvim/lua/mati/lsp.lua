
--local function on_attach()
	
--end

require'lspconfig'.tsserver.setup{ on_attach=on_attach }
require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
require'lspsaga'.init_lsp_saga()

