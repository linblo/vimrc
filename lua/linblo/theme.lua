local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables

require("material").setup({
    lualine_style = "stealth",
})

g.material_style = "deep ocean"
g.tokyonight_style = "night"

cmd([[colorscheme 84]]) -- Put your favorite colorscheme here
