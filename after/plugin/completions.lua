local cmp = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
	}),
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig")["clangd"].setup {
    capabilities = capabilities
}
require("lspconfig")["pylsp"].setup {
    capabilities = capabilities
}
require("lspconfig")["lua_ls"].setup {
    capabilities = capabilities
}
