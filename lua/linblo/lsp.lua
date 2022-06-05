require("nvim-lsp-installer").setup()
local lspconfig = require("lspconfig")

-- LSP this is needed for LSP completions in CSS along with the snippets plugin
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--   properties = {
--     "documentation",
--     "detail",
--     "additionalTextEdits",
--   },
-- }

-- LSP Prevents inline buffer annotations
vim.diagnostic.open_float(nil, {
	source = "always",
})

-- LSP Saga config & keys https://github.com/glepnir/lspsaga.nvim
-- local saga = require("lspsaga")
-- saga.init_lsp_saga({
--   code_action_icon = " ",
--   definition_preview_icon = "  ",
--   diagnostic_header_icon = "   ",
--   error_sign = " ",
--   finder_definition_icon = "  ",
--   finder_reference_icon = "  ",
--   hint_sign = "⚡",
--   infor_sign = "",
--   warn_sign = "",
-- })

local on_attach = function(client, bufnr)
	require("aerial").on_attach(client, bufnr)
end

-- lspconfig.denols.setup({
--   filetypes = { "javascript", "typescript" },
--   init_options = { enable = true, lint = true, unstable = true },
--   on_attach,
-- })

lspconfig.eslint.setup({
	-- client.resolved_capabilities.document_formatting = false
	-- common_on_attach(client, bufnr)
	-- end
	filetypes = { "javascript", "typescript" },
	settings = {
		format = { enable = false }, -- this will enable formatting
	},
	on_attach,
})
lspconfig.tsserver.setup({
	-- client.resolved_capabilities.document_formatting = false
	-- common_on_attach(client, bufnr)
	-- end
	filetypes = { "javascript", "typescript" },
	on_attach,
})
lspconfig.rome.setup({
	filetypes = { "javascript", "typescript" },
	on_attach,
})
lspconfig.rust_analyzer.setup({
	on_attach,
})
lspconfig.sumneko_lua.setup({
	on_attach,
})
lspconfig.gopls.setup({
	on_attach,
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
			},
		}),
		require("null-ls").builtins.formatting.stylua,
		-- .with({
		--   args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
		-- }),
	},
	on_attach,
})

-- the duration in there is to stop timeouts on massive files
vim.cmd("autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync(nil, 7500)")
