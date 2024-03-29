-- Setup nvim-cmp.
local cmp = require'cmp'

local lspkind = require'lspkind'

cmp.setup({
    snippet = {
        expand = function(args)
            -- For `vsnip` user.
			 vim.fn["vsnip#anonymous"](args.body)

            -- For `luasnip` user.
            --require('luasnip').lsp_expand(args.body)

            -- For `ultisnips` user.
            -- vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = {
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },

    sources = {
        { name = 'nvim_lsp' },

        -- For vsnip user.
		 { name = 'vsnip' },

        -- For luasnip user.
		--{ name = 'luasnip' },

        -- For ultisnips user.
        -- { name = 'ultisnips' },

        { name = 'buffer' },
    }, 

	formatting = {
		format = lspkind.cmp_format({
			with_text = true, -- do not show text alongside icons
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
		})
	},
})
