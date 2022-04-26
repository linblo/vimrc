local actions = require("telescope.actions")

require("telescope").load_extension("fzy_native")
require("telescope").load_extension("gh")

require("telescope").setup({
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    prompt_prefix = " >",
    color_devicons = true,
    file_ignore_patterns = { "node_modules", ".git", "vendor" },
    winblend = 10,
    sorting_strategy = "descending",
    layout_strategy = "horizontal",

    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<C-x>"] = false,
      },
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
})

local M = {}

M.git_branches = function()
  require("telescope.builtin").git_branches({
    attach_mappings = function(prompt_bufnr, map)
      map("i", "<c-d>", actions.git_delete_branch)
      map("n", "<c-d>", actions.git_delete_branch)
      return true
    end,
  })
end

return M
