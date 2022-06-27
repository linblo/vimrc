require("nvim-lsp-installer").setup()
local lspconfig = require("lspconfig")

-- LSP Prevents inline buffer annotations
vim.diagnostic.open_float(nil, {
	source = "always",
})

local function on_attach(client, bufnr)
	require("aerial").on_attach(client, bufnr)
end

-- lspconfig.denols.setup({
--   filetypes = { "javascript", "typescript" },
--   init_options = { enable = true, lint = true, unstable = true },
--   on_attach,
-- })

lspconfig.tsserver.setup({
	-- client.resolved_capabilities.document_formatting = false
	-- common_on_attach(client, bufnr)
	-- end
	filetypes = { "javascript", "typescript" },
	on_attach = on_attach,
})
lspconfig.eslint.setup({
	-- client.resolved_capabilities.document_formatting = false
	-- common_on_attach(client, bufnr)
	-- end
	filetypes = { "javascript", "typescript" },
	settings = {
		format = { enable = false }, -- this will enable formatting
	},
	on_attach = on_attach,
})
lspconfig.rome.setup({
	filetypes = { "javascript", "typescript" },
	on_attach = on_attach,
})
lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
})
lspconfig.sumneko_lua.setup({
	on_attach = on_attach,
})
lspconfig.gopls.setup({
	on_attach = on_attach,
})
lspconfig.lemminx.setup({
	on_attach = on_attach,
})

local lspkind = require("lspkind")

-- Setup lspconfig.
require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.prettier.with({
			filetypes = {
				"javascript",
				"typescript",
				"css",
				"scss",
				"html",
				"json",
				"yaml",
				"markdown",
				"graphql",
				"md",
				"txt",
				"svg",
			},
		}),
		require("null-ls").builtins.formatting.stylua,
		-- .with({
		--   args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
		-- }),
	},
	-- on_attach,
})

-- the duration in there is to stop timeouts on massive files
vim.cmd("autocmd BufWritePre * lua vim.lsp.buf.format()")
