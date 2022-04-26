local lsp_installer = require("nvim-lsp-installer")
--
-- LSP this is needed for LSP completions in CSS along with the snippets plugin
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
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


lsp_installer.on_server_ready(function(server)
  local opts = {}

  -- (optional) Customize the options passed to the server
  if server.name == "denols" then
    opts.filetypes = { "javascript", "typescript" }
    opts.init_options = { enable = true, lint = true, unstable = true }
  end

  if server.name == "eslint" then
    -- opts.on_attach = function(client, bufnr)
    -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
    -- the resolved capabilities of the eslint server ourselves!
    opts.filetypes = { "javascript", "typescript" }
    -- client.resolved_capabilities.document_formatting = false
    -- common_on_attach(client, bufnr)
    -- end
    opts.settings = {
      format = { enable = false }, -- this will enable formatting
    }
  end
  if server.name == "rome" then
    opts.filetypes = { "javascript", "typescript" }
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/ADVANCED_README.md
  server:setup(opts)
end)

local lspkind = require("lspkind")
local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  },
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "buffer" },
    { name = "path" },
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      maxwidth = 50,
      menu = {
        buffer = "",
        nvim_lsp = "",
        spell = "",
        look = "",
      },
    }),
  },
  view = {
    entries = "native",
  },
  experimental = {
    ghost_text = true,
  },
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

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
    require("null-ls").builtins.formatting.stylua.with({
      args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
    }),
  },
})

-- the duration in there is to stop timeouts on massive files
vim.cmd("autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync(nil, 7500)")
