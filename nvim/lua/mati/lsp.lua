
local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }, _config or {})
end

require'lspconfig'.tsserver.setup(config({ on_attach=on_attach }))
require'lspconfig'.vuels.setup{ on_attach=on_attach }
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
      'bash',
      'css',
      'dockerfile',
      'go',
      'gomod',
      'graphql',
      'html',
      'javascript',
      'jsdoc',
      'json',
      'python',
      'tsx',
      'lua',
      'typescript',
      'yaml',
    },
	highlight = {
		enable = true
	}
}
require'lspsaga'.init_lsp_saga()

require'lspconfig'.gopls.setup(config({
	on_attach=on_attach,
	cmd = {"gopls", "serve"},
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},

}))
