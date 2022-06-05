-- You will need to install language servers `npm i -g vscode-langservers-extracted` and `npm install -g typescript typescript-language-server`

local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables

-- Map leader to space
g.mapleader = " "

local install_path = fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "--depth=1", "https://github.com/savq/paq-nvim.git", install_path })
end

-- Plugins
require("paq")({
	"lewis6991/impatient.nvim",
	"nathom/filetype.nvim",
	"nvim-treesitter/nvim-treesitter",
	"nvim-lua/plenary.nvim",
	"stevearc/dressing.nvim",
	"hrsh7th/nvim-cmp",
	"f3fora/cmp-spell",
	"hrsh7th/cmp-emoji",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp",
	-- "hrsh7th/cmp-vsnip",
	-- "hrsh7th/vim-vsnip",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp-document-symbol",
	"saadparwaiz1/cmp_luasnip",
	{ "tzachar/cmp-tabnine", run = "./install.sh" },
	"octaltree/cmp-look",
	"jose-elias-alvarez/null-ls.nvim",
	"nvim-neo-tree/neo-tree.nvim",
	-- "kyazdani42/nvim-tree.lua",
	"kyazdani42/nvim-web-devicons",
	"lewis6991/gitsigns.nvim",
	"neovim/nvim-lspconfig",
	"norcalli/nvim-colorizer.lua",
	"numToStr/Comment.nvim",
	"nvim-lua/popup.nvim",
	"nvim-lualine/lualine.nvim",
	"nvim-telescope/telescope-fzy-native.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-github.nvim",
	"nvim-telescope/telescope-symbols.nvim",
	"onsails/lspkind-nvim",
	"p00f/nvim-ts-rainbow",
	"phaazon/hop.nvim",
	"savq/paq-nvim",
	"tami5/lspsaga.nvim",
	"tpope/vim-repeat",
	"ur4ltz/surround.nvim",
	"wellle/targets.vim",
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",
	"winston0410/cmd-parser.nvim",
	"winston0410/range-highlight.nvim",
	"glepnir/dashboard-nvim",
	"williamboman/nvim-lsp-installer",
	"MunifTanjim/nui.nvim",
	"vuki656/package-info.nvim",
	"pwntester/octo.nvim",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	-- "glepnir/galaxyline.nvim",
	"SmiteshP/nvim-gps",
	-- "ggandor/lightspeed.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"folke/which-key.nvim",
	-- "karb94/neoscroll.nvim",
	"FotiadisM/tabset.nvim",
	"stevearc/aerial.nvim",
	"simrat39/symbols-outline.nvim",
	"rmagatti/auto-session",
	"declancm/cinnamon.nvim",
	"akinsho/git-conflict.nvim",
	-- "nvim-orgmode/orgmode",
	"folke/trouble.nvim",
	"akinsho/toggleterm.nvim",
	"sindrets/diffview.nvim",
	"Mofiqul/dracula.nvim",
	"folke/tokyonight.nvim",
	"marko-cerovac/material.nvim",
	"navarasu/onedark.nvim",
	"VDuchauffour/neodark.nvim",
	"projekt0n/github-nvim-theme",
	"catppuccin/nvim",
	"cocopon/iceberg.vim",
	"rebelot/kanagawa.nvim",
})
require("impatient")

-- g.nvim_tree_respect_buf_cwd = 1
-- g.nvim_tree_highlight_opened_files = 1
-- require("nvim-tree").setup({})

require("neo-tree").setup()
require("git-conflict").setup({
	default_mappings = false,
})

require("trouble").setup()
require("toggleterm").setup()
require("aerial").setup({})

-- lazygit
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })

function _lazygit_toggle()
	lazygit:toggle()
end

require("Comment").setup()
require("indent_blankline").setup({
	filetype_exclude = {
		"help",
		"terminal",
		"dashboard",
		"packer",
		"lspinfo",
		"TelescopePrompt",
		"TelescopeResults",
	},
	buftype_exclude = { "terminal" },
	show_current_context = true,
})
require("linblo.dashboard")
require("range-highlight").setup({})
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"html",
		"css",
		"scss",
		"javascript",
		"typescript",
		"json",
		"c",
		"cpp",
		"go",
		"rust",
		"lua",
	},
	highlight = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},
	autotag = {
		enable = true,
		filetypes = {
			"html",
			"javascript",
			"typescript",
			"markdown",
		},
	},
})

-- gitsigns setup
require("gitsigns").setup({
	current_line_blame = true,
})

-- Session
require("auto-session").setup({
	log_level = "info",
	auto_session_enable_last_session = false,
	auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
	auto_session_enabled = true,
	auto_save_enabled = true,
	auto_restore_enabled = false,
	auto_session_suppress_dirs = nil,
})

-- Setup treesitter
local ts = require("nvim-treesitter.configs")
ts.setup({ highlight = { enable = true } })

require("linblo.options")
require("colorizer").setup()

-- Use spelling for markdown files ‘]s’ to find next, ‘[s’ for previous, 'z=‘ for suggestions when on one.
-- Source: http:--thejakeharding.com/tutorial/2012/06/13/using-spell-check-in-vim.html
-- Also I'm adding different sources for completion here, if you aren't on Mac you might need to install "look"
vim.api.nvim_exec(
	[[
        augroup markdownSpell
        autocmd!
        autocmd FileType markdown,md,txt setlocal spell
        autocmd BufRead,BufNewFile *.md,*.txt,*.markdown setlocal spell
        autocmd FileType markdown,md,txt lua require'cmp'.setup.buffer {
            \   sources = {
                \     { name = 'spell' },
                \     { name = 'buffer' },
                \     { name = 'look', keyword_length=3 },
                \   },
                \ }
                augroup END
                ]],
	false
)

-- Give me some fenced codeblock goodness
g.markdown_fenced_languages = { "html", "javascript", "typescript", "css", "scss", "lua", "vim" }

require("linblo.lsp")
require("linblo.completion")
require("linblo.telescope")

cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = true}") -- disabled in visual mode

require("tabset").setup({
	defaults = {
		tabwidth = 4,
		expandtab = true,
	},
	languages = {
		rust = {
			tabwidth = 8,
			expandtab = false,
		},
		go = {
			tabwidth = 8,
			expandtab = false,
		},
		{
			filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "yaml" },
			config = {
				tabwidth = 2,
			},
		},
	},
})

require("linblo.lualine")
require("nvim-autopairs").setup({})

require("package-info").setup({
	package_manager = "npm",
})
require("which-key").setup({
	window = {
		border = "none", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 1, 1, 1 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 5,
	},
})

require("octo").setup()
--
-- require('neoscroll').setup()
require("cinnamon").setup({
	default_keymaps = true, -- Create default keymaps.
	extra_keymaps = true, -- Create extra keymaps.
	extended_keymaps = true, -- Create extended keymaps.
	centered = true, -- Keep cursor centered in window when using window scrolling.
	default_delay = 0.2, -- The default delay (in ms) between each line when scrolling.
	horizontal_scroll = true, -- Enable smooth horizontal scrolling when view shifts left or right.
	scroll_limit = 150, -- Max number of lines moved before scrolling is skipped.
})

require("surround").setup({ mappings_style = "sandwich" })

-- require("orgmode").setup_ts_grammar()
-- require("nvim-treesitter.configs").setup({
--     highlight = {
--         enable = true,
--         disable = { "org" }, -- Remove this to use TS highlighter for some of the highlights (Experimental)
--         additional_vim_regex_highlighting = { "org" }, -- Required since TS highlighter doesn't support all syntax features (conceal)
--     },
--     ensure_installed = { "org" }, -- Or run :TSUpdate org
-- })
--
-- require("orgmode").setup({
--     org_agenda_files = { "~/orgs/**/*" },
--     org_default_notes_file = "~/org/refile.org",
-- })
--
require("linblo.mappings")

require("linblo.theme")

vim.cmd("highlight WinSeparator guibg=NONE")
