local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Nvim Tree
map("n", "<c-t>", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<leader>u", ":NvimTreeFindFile<CR>", { silent = true })

-- LSP Saga
map("n", "<Leader>cf", ":Lspsaga lsp_finder<CR>", { silent = true })
map("n", "<leader>ca", ":Lspsaga code_action<CR>", { silent = true })
map("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", { silent = true })
map("n", "<leader>ch", ":Lspsaga hover_doc<CR>", { silent = true })
map("n", "<leader>ck", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', { silent = true })
map("n", "<leader>cj", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', { silent = true })
map("n", "<leader>cs", ":Lspsaga signature_help<CR>", { silent = true })
map("n", "<leader>ci", ":Lspsaga show_line_diagnostics<CR>", { silent = true })
map("n", "<leader>cn", ":Lspsaga diagnostic_jump_next<CR>", { silent = true })
map("n", "<leader>cp", ":Lspsaga diagnostic_jump_prev<CR>", { silent = true })
map("n", "<leader>cr", ":Lspsaga rename<CR>", { silent = true })
map("n", "<leader>cd", ":Lspsaga preview_definition<CR>", { silent = true })
map("n", "<leader>=", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", { silent = false })

local opts = { noremap = true, silent = true }

-- LSP
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "go", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
map("n", "gj", "<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<cr>", opts)
map("n", "gk", "<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<cr>", opts)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
map("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

-- Gitsigns
map("n", "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", opts)
map("n", "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", opts)
map("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", opts)
map("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", opts)
map("n", "<leader>gh", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", opts)
map("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", opts)
map("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", opts)
map("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", opts)
map("n", "<leader>gd", "<cmd>lua require 'gitsigns'.diffthis()<cr>", opts)

-- Telescope
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", opts)
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", opts)
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", opts)
map("n", "<leader>ta", "<cmd>Telescope help_tags<CR>", opts)
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", opts)
map("n", "<leader>o", "<cmd>Telescope oldfiles<CR>", opts)
map("n", "<leader>sh", "<cmd>Telescope help_tags<CR>", opts)
map("n", "<leader>sm", "<cmd>Telescope man_pages<CR>", opts)
map("n", "<leader>sn", "<cmd>Telescope notify<CR>", opts)
map("n", "<leader>sk", "<cmd>Telescope keymaps<CR>", opts)
map("n", "<leader>sc", "<cmd>Telescope commands<CR>", opts)
map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", opts)
map("n", "<leader>lR", "<cmd>Telescope lsp_references<CR>", opts)
map("n", "<leader>lD", "<cmd>Telescope diagnostics<CR>", opts)
map(
  "n",
  "<Leader>f",
  '<cmd>lua require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({}))<cr>'
)
map("n", "<leader>r", '<cmd>lua require("telescope.builtin").registers()<cr>')
map(
  "n",
  "<leader>/",
  '<cmd>lua require("telescope.builtin").live_grep(require("telescope.themes").get_dropdown({}))<cr>'
)
map("n", "<leader>b", '<cmd>lua require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({}))<cr>')
map("n", "<leader>h", '<cmd>lua require("telescope.builtin").help_tags()<cr>')
map(
  "n",
  "<leader>th",
  '<cmd>lua require("telescope.builtin").file_browser(require("telescope.themes").get_dropdown({}))<cr>'
)
map("n", "<leader>spl", '<cmd>lua require("telescope.builtin").spell_suggest()<cr>')
map("n", "<leader>gpr", '<cmd>lua require("telescope").extensions.gh.pull_request()<cr>')

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
map("n", "<Leader>w", "<cmd>:w<CR>")
map("n", "<Delete>", "<cmd>:w<CR>")

-- Tab to switch buffers in Normal mode
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-- More molecular undo of text
-- map("i", ",", ",<c-g>u")
-- map("i", ".", ".<c-g>u")
-- map("i", "!", "!<c-g>u")
-- map("i", "?", "?<c-g>u")
-- map("i", ";", ";<c-g>u")
-- map("i", ":", ":<c-g>u")
--
-- Keep search results centred
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- Make Y yank to end of the line
map("n", "Y", "y$")

-- Line bubbling
map("n", "<c-j>", "<cmd>m .+1<CR>==", { silent = true })
map("n", "<c-k>", "<cmd>m .-2<CR>==", { silent = true })
map("v", "<c-j>", ":m '>+1<CR>==gv=gv", { silent = true })
map("v", "<c-k>", ":m '<-2<CR>==gv=gv", { silent = true })

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
map("n", "<Leader>H", "<cmd>lua require'hop'.hint_words()<cr>")
map("n", "<Leader>L", "<cmd>lua require'hop'.hint_lines()<cr>")
map("v", "<Leader>H", "<cmd>lua require'hop'.hint_words()<cr>")
map("v", "<Leader>L", "<cmd>lua require'hop'.hint_lines()<cr>")

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