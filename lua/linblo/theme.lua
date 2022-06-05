local cmd = vim.cmd
local fn = vim.fn
local g = vim.g

require("material").setup({
    lualine_style = "stealth",
})

g.material_style = "deep ocean"
g.tokyonight_style = "night"

require("onedark").setup({
    style = "deep",
})

require("neodark").setup({
    theme_style = "neodarker",
})

require("catppuccin").setup({
    transparent_background = false,
    term_colors = true,
    -- styles = {
    --     comments = "italic",
    --     conditionals = "italic",
    --     loops = "NONE",
    --     functions = "bold",
    --     keywords = "NONE",
    --     strings = "NONE",
    --     variables = "NONE",
    --     numbers = "NONE",
    --     booleans = "NONE",
    --     properties = "NONE",
    --     types = "NONE",
    --     operators = "NONE",
    -- },
    integrations = {
        treesitter = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = "italic",
                hints = "italic",
                warnings = "italic",
                information = "italic",
            },
            underlines = {
                errors = "underline",
                hints = "underline",
                warnings = "underline",
                information = "underline",
            },
        },
        lsp_trouble = true,
        cmp = true,
        lsp_saga = true,
        gitgutter = false,
        gitsigns = true,
        telescope = true,
        nvimtree = {
            enabled = true,
            show_root = false,
            transparent_panel = false,
        },
        neotree = {
            enabled = true,
            show_root = false,
            transparent_panel = false,
        },
        which_key = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        dashboard = true,
        neogit = false,
        vim_sneak = false,
        fern = false,
        barbar = false,
        bufferline = true,
        markdown = true,
        lightspeed = false,
        ts_rainbow = false,
        hop = true,
        notify = true,
        telekasten = true,
        symbols_outline = true,
    },
})
vim.g.catppuccin_flavour = "mocha"

require("github-theme").setup()

require("kanagawa").setup({
    undercurl = true, -- enable undercurls
    commentStyle = "italic",
    functionStyle = "NONE",
    keywordStyle = "italic",
    statementStyle = "bold",
    typeStyle = "NONE",
    variablebuiltinStyle = "italic",
    specialReturn = true, -- special highlight for the return keyword
    specialException = true, -- special highlight for exception handling keywords
    transparent = false, -- do not set background color
    dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    globalStatus = false, -- adjust window separators highlight for laststatus=3
    colors = {},
    overrides = {},
})

cmd([[colorscheme 84]]) -- Put your favorite colorscheme here
