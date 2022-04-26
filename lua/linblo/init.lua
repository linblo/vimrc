-- You will need to install language servers `npm i -g vscode-langservers-extracted` and `npm install -g typescript typescript-language-server`

local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables

-- Map leader to space
g.mapleader = " "

-- Bootstrap Paq when needed
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "--depth=1", "https://github.com/savq/paq-nvim.git", install_path })
end

-- Plugins
require("paq")({
  "nathom/filetype.nvim",
  "nvim-treesitter/nvim-treesitter",
  "stevearc/dressing.nvim",
  "hrsh7th/nvim-cmp",
  "f3fora/cmp-spell",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp-document-symbol",
  "jose-elias-alvarez/null-ls.nvim",
  "kyazdani42/nvim-tree.lua",
  "kyazdani42/nvim-web-devicons",
  "lewis6991/gitsigns.nvim",
  "neovim/nvim-lspconfig",
  "norcalli/nvim-colorizer.lua",
  "numToStr/Comment.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "nvim-lualine/lualine.nvim",
  "nvim-telescope/telescope-fzy-native.nvim",
  "nvim-telescope/telescope.nvim",
  "octaltree/cmp-look",
  "onsails/lspkind-nvim",
  "p00f/nvim-ts-rainbow",
  "phaazon/hop.nvim",
  "savq/paq-nvim",
  "tami5/lspsaga.nvim",
  "tpope/vim-repeat",
  "blackCauldron7/surround.nvim",
  "wellle/targets.vim",
  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",
  "winston0410/cmd-parser.nvim",
  "winston0410/range-highlight.nvim",
  "glepnir/dashboard-nvim",
  "williamboman/nvim-lsp-installer",
  "nvim-telescope/telescope-github.nvim",
  "MunifTanjim/nui.nvim",
  "vuki656/package-info.nvim",
  "pwntester/octo.nvim",
  -- "glepnir/galaxyline.nvim",
  "SmiteshP/nvim-gps",
  -- "ggandor/lightspeed.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "folke/which-key.nvim",
  "karb94/neoscroll.nvim",
  "FotiadisM/tabset.nvim",
  "simrat39/symbols-outline.nvim",
})

require("nvim-tree").setup()
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

-- -- Session
-- local sessionopts = {
--   log_level = "info",
--   auto_session_enable_last_session = false,
--   auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
--   auto_session_enabled = true,
--   auto_save_enabled = true,
--   auto_restore_enabled = true,
--   auto_session_suppress_dirs = nil,
-- }
-- require("auto-session").setup(sessionopts)

-- Setup treesitter
local ts = require("nvim-treesitter.configs")
ts.setup({ highlight = { enable = true } })

cmd([[colorscheme 84]]) -- Put your favorite colorscheme here

require("linblo.options")
-- This little monkey has to go after termguicolors is set or gets upset
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
require("linblo.telescope")

cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = true}") -- disabled in visual mode

require("tabset").setup({
  defaults = {
    tabwidth = 4,
    expandtab = true,
  },
  languages = {
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
require("which-key").setup()

require("octo").setup()
-- require('neoscroll').setup()
require("surround").setup({ mappings_style = "sandwich" })

require("linblo.mappings")
