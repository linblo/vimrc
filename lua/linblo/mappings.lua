-- local function map(mode, lhs, rhs, opts)
--     local options = { noremap = true }
--     if opts then
--         options = vim.tbl_extend("force", options, opts)
--     end
--     vim.api.nvim_set_keymap(mode, lhs, rhs, options)
-- end
local map = vim.keymap.set
--
-- Nvim Tree
-- map("n", "<c-t>", ":NvimTreeToggle<CR>", { desc = "Tree", silent = true })

--Themes NeoTree
map("n", "<c-t>", ":NeoTreeFocusToggle<CR>", { desc = "Tree", silent = true })
map("n", "<leader>tt", ":NeoTreeFloatToggle<CR>", { desc = "Tree floating", silent = true })
-- LSP Saga
map("n", "<Leader>cf", ":Lspsaga lsp_finder<CR>", { desc = "Code finder", silent = true })
map("n", "<leader>ca", ":Lspsaga code_action<CR>", { desc = "Code action", silent = true })
map("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", { desc = "Code action range", silent = true })
-- map("n", "<leader>ch", ":Lspsaga hover_doc<CR>", { silent = true })
map("n", "K", ":Lspsaga hover_doc<CR>", { silent = true, desc = "LSP Hover" })
map("n", "<leader>ck", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', { silent = true })
map("n", "<leader>cj", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', { silent = true })
map("n", "<leader>cs", ":Lspsaga signature_help<CR>", { desc = "Signature", silent = true })
map("n", "<leader>ci", ":Lspsaga show_line_diagnostics<CR>", { desc = "Line diagnostics", silent = true })
map("n", "<leader>cn", ":Lspsaga diagnostic_jump_next<CR>", { desc = "Next (diag)", silent = true })
map("n", "<leader>cp", ":Lspsaga diagnostic_jump_prev<CR>", { desc = "Previous (diag)", silent = true })
map("n", "<leader>cr", ":Lspsaga rename<CR>", { desc = "Rename", silent = true })
map("n", "<leader>cd", ":Lspsaga preview_definition<CR>", { desc = "Definition preview", silent = true })
map("n", "<leader>=", "<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>", { desc = "Format", silent = false })

local opts = { noremap = true, silent = true }

-- LSP
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true, desc = "Goto declaration" })
map("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true, desc = "Action" })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true, desc = "Goto definition" })
map(
	"n",
	"gI",
	"<cmd>lua vim.lsp.buf.implementation()<CR>",
	{ noremap = true, silent = true, desc = "Goto implementation" }
)
map(
	"n",
	"gT",
	"<cmd>lua vim.lsp.buf.type_definition()<CR>",
	{ noremap = true, silent = true, desc = "Goto type definition" }
)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true, desc = "References" })
map("n", "go", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true, desc = "Float" })
map(
	"n",
	"gj",
	"<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<cr>",
	{ noremap = true, silent = true, desc = "Next (diag)" }
)
map(
	"n",
	"gk",
	"<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<cr>",
	{ noremap = true, silent = true, desc = "Previous (diag)" }
)
map("n", "gK", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true, desc = "Hover" })
map("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true, desc = "Rename" })
map("n", "<leader>li", "<cmd>LspInfo<cr>", { noremap = true, silent = true, desc = "LSP info" })
map("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", { noremap = true, silent = true, desc = "LSP Install info" })

-- GitConflict
map("n", "<leader>ko", ":GitConflictChooseOurs<CR>", { silent = true })
map("n", "<leader>kb", ":GitConflictChooseBoth<CR>", { silent = true })
map("n", "<leader>k0", ":GitConflictChooseNone<CR>", { silent = true })
map("n", "<leader>kt", ":GitConflictChooseTheirs<CR>", { silent = true })
map("n", "<leader>kn", ":GitConflictNextConflict<CR>", { silent = true })
map("n", "<leader>kp", ":GitConflictPrevConflict<CR>", { silent = true })

-- Gitsigns
map(
	"n",
	"<leader>Gj",
	"<cmd>lua require 'gitsigns'.next_hunk()<cr>",
	{ noremap = true, silent = true, desc = "Next hunk" }
)
map(
	"n",
	"<leader>Gk",
	"<cmd>lua require 'gitsigns'.prev_hunk()<cr>",
	{ noremap = true, silent = true, desc = "Previous hunk" }
)
map(
	"n",
	"<leader>Gl",
	"<cmd>lua require 'gitsigns'.blame_line()<cr>",
	{ noremap = true, silent = true, desc = "Blame line" }
)
map(
	"n",
	"<leader>Gp",
	"<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
	{ noremap = true, silent = true, desc = "Preview hunk" }
)
map(
	"n",
	"<leader>Gh",
	"<cmd>lua require 'gitsigns'.reset_hunk()<cr>",
	{ noremap = true, silent = true, desc = "Reset hunk" }
)
map(
	"n",
	"<leader>Gr",
	"<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
	{ noremap = true, silent = true, desc = "Reset buffer" }
)
map(
	"n",
	"<leader>Gs",
	"<cmd>lua require 'gitsigns'.stage_hunk()<cr>",
	{ noremap = true, silent = true, desc = "Stage hunk" }
)
map(
	"n",
	"<leader>Gu",
	"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
	{ noremap = true, silent = true, desc = "Undo stage hunk" }
)
map(
	"n",
	"<leader>Gd",
	"<cmd>lua require 'gitsigns'.diffthis()<cr>",
	{ noremap = true, silent = true, desc = "Diff this" }
)

-- Trouble
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", { desc = "Trouble", silent = true, noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>xw",
	"<cmd>Trouble workspace_diagnostics<cr>",
	{ desc = "Trouble workspace", silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>xd",
	"<cmd>Trouble document_diagnostics<cr>",
	{ desc = "Trouble document", silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>xl",
	"<cmd>Trouble loclist<cr>",
	{ desc = "Trouble location list", silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>xq",
	"<cmd>Trouble quickfix<cr>",
	{ desc = "Trouble quickfix list", silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>xr",
	"<cmd>Trouble lsp_references<cr>",
	{ desc = "Trouble references", silent = true, noremap = true }
)

-- Lazygit
vim.api.nvim_set_keymap(
	"n",
	"<leader>lg",
	"<cmd>lua _lazygit_toggle()<CR>",
	{ desc = "lazygit", noremap = true, silent = true }
)

-- Telescope
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { noremap = true, silent = true, desc = "Git status" })
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { noremap = true, silent = true, desc = "Git branches" })
map("n", "<leader>gC", "<cmd>telescope git_commits<cr>", { noremap = true, silent = true, desc = "Git commits" })
map(
	"n",
	"<leader>gc",
	"<cmd>telescope git_bcommits<cr>",
	{ noremap = true, silent = true, desc = "Git buffer commits" }
)
map("n", "<leader>ta", "<cmd>Telescope help_tags<CR>", { noremap = true, silent = true, desc = "Help" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { noremap = true, silent = true, desc = "Marks" })
map("n", "<leader>o", "<cmd>Telescope oldfiles<CR>", { noremap = true, silent = true, desc = "File history" })
map("n", "<leader>sm", "<cmd>Telescope man_pages<CR>", { noremap = true, silent = true, desc = "Man pages" })
map("n", "<leader>sn", "<cmd>Telescope notify<CR>", opts)
map("n", "<leader>sk", "<cmd>Telescope keymaps<CR>", { noremap = true, silent = true, desc = "Key mappings" })
map("n", "<leader>sc", "<cmd>Telescope commands<CR>", { noremap = true, silent = true, desc = "commands" })
map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", { noremap = true, silent = true, desc = "Symbols" })
map("n", "<leader>lR", "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true, desc = "References" })
map("n", "<leader>le", "<cmd>Telescope symbols<CR>", { noremap = true, silent = true, desc = "Emoji symbols" })
map("n", "<leader>jl", "<cmd>Telescope jumplist<CR>", { noremap = true, silent = true, desc = "Jumplist" })
map("n", "<leader>sh", "<cmd>Telescope search_history<CR>", { noremap = true, silent = true, desc = "Search history" })
map("n", "<leader>C", "<cmd>Telescope colorscheme<CR>", { noremap = true, silent = true, desc = "Colorschemes" })

map("n", "<leader>lD", function()
	require("telescope.builtin").diagnostics()
end, { desc = "Telescope search diagnostics" })
map(
	"n",
	"<Leader>f",
	'<cmd>lua require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({}))<cr>',
	{ desc = "Fuzzy files" }
)
map("n", "<leader>r", '<cmd>lua require("telescope.builtin").registers()<cr>', { desc = "Registers" })
map(
	"n",
	"<leader>/",
	'<cmd>lua require("telescope.builtin").live_grep(require("telescope.themes").get_dropdown({}))<cr>',
	{ desc = "Find/Grep" }
)
map(
	"n",
	"<leader>b",
	'<cmd>lua require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({}))<cr>',
	{ desc = "Buffers" }
)
map("n", "<leader>h", '<cmd>lua require("telescope.builtin").help_tags()<cr>', { desc = "Help" })
map(
	"n",
	"<leader>th",
	'<cmd>lua require("telescope.builtin").file_browser(require("telescope.themes").get_dropdown({}))<cr>',
	{ desc = "File browser" }
)
map("n", "<leader>spl", '<cmd>lua require("telescope.builtin").spell_suggest()<cr>')
map("n", "<leader>gpr", '<cmd>lua require("telescope").extensions.gh.pull_request()<cr>')

map("n", "<Leader>c", ":bdelete!<CR>", { desc = "Close buffer" })
-- Symbols
map("n", "<Leader>Y", ":SymbolsOutline<CR>", { desc = "Symbols" })
map("n", "<Leader>y", ":AerialToggle<CR>", { desc = "Symbols" })

-- Open nvimrc file
map("n", "<Leader>v", "<cmd>e $MYVIMRC<CR>")

-- Source nvimrc file
map("n", "<Leader>sv", ":luafile %<CR>")

-- Quick new file
map("n", "<Leader>n", "<cmd>enew<CR>")

-- Easy select all of file
map("n", "<Leader>sa", "ggVG<c-$>")

-- Make visual yanks place the cursor back where started
map("v", "y", "ygv<Esc>")

-- Easier file save
map("n", "<Leader>w", "<cmd>:w<CR>", { desc = "Write" })

-- Keep search results centred
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- Make Y yank to end of the line
map("n", "Y", "y$")
--
-- Line bubbling
-- map("n", "<c-j>", "<cmd>m .+1<CR>==", { silent = true })
-- map("n", "<c-k>", "<cmd>m .-2<CR>==", { silent = true })
map("v", "J", ":m '>+1<CR>==gv=gv", { silent = true, desc = "Move line down" })
map("v", "K", ":m '<-2<CR>==gv=gv", { silent = true, desc = "Move line up" })

--Auto close tags
-- map("i", ",/", "</<C-X><C-O>")

--After searching, pressing escape stops the highlight
map("n", "<esc>", ":noh<cr><esc>", { silent = true })

-- Easy add date/time
map("n", "<Leader>T", "\"=strftime('%c')<CR>Pa", { silent = true })

--
-- lua require('telescope').extensions.gh.issues()<CR>
-- lua require('telescope').extensions.gh.gist()<cr>
-- lua require('telescope').extensions.gh.run()<cr>

-- Easier split mappings
map("n", "<Leader><Down>", "<C-W><C-J>", { silent = true })
map("n", "<Leader><Up>", "<C-W><C-K>", { silent = true })
map("n", "<Leader><Right>", "<C-W><C-L>", { silent = true })
map("n", "<Leader><Left>", "<C-W><C-H>", { silent = true })

-- Hop
require("hop").setup()
map("n", "<Leader>H", "<cmd>lua require'hop'.hint_words()<cr>", { desc = "Hop words" })
map("n", "<Leader>L", "<cmd>lua require'hop'.hint_lines()<cr>", { desc = "Hop lines" })
map("v", "<Leader>H", "<cmd>lua require'hop'.hint_words()<cr>", { desc = "Hop words" })
map("v", "<Leader>L", "<cmd>lua require'hop'.hint_lines()<cr>", { desc = "Hop lines" })

vim.cmd("hi HopNextKey guifg=#ff9900")
vim.cmd("hi HopNextKey1 guifg=#ff9900")
vim.cmd("hi HopNextKey2 guifg=#ff9900")

-- Show package versions
vim.api.nvim_set_keymap("n", "<leader>ns", ":lua require('package-info').show()<CR>", { silent = true, noremap = true })

-- Hide package versions
vim.api.nvim_set_keymap("n", "<leader>nc", ":lua require('package-info').hide()<CR>", { silent = true, noremap = true })

-- Update package on line
vim.api.nvim_set_keymap(
	"n",
	"<leader>nu",
	":lua require('package-info').update()<CR>",
	{ silent = true, noremap = true }
)

-- Delete package on line
vim.api.nvim_set_keymap(
	"n",
	"<leader>nd",
	":lua require('package-info').delete()<CR>",
	{ silent = true, noremap = true }
)

-- Install a new package
vim.api.nvim_set_keymap(
	"n",
	"<leader>ni",
	":lua require('package-info').install()<CR>",
	{ silent = true, noremap = true }
)

-- Reinstall dependencies
vim.api.nvim_set_keymap(
	"n",
	"<leader>nr",
	":lua require('package-info').reinstall()<CR>",
	{ silent = true, noremap = true }
)

-- Install a different package version
vim.api.nvim_set_keymap(
	"n",
	"<leader>np",
	":lua require('package-info').change_version()<CR>",
	{ silent = true, noremap = true }
)
