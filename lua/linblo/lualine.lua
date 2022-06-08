local function getWords()
	if vim.bo.filetype == "md" or vim.bo.filetype == "txt" or vim.bo.filetype == "markdown" then
		return tostring(vim.fn.wordcount().words)
	else
		return ""
	end
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = " ", right = " " },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = { "mode", "paste" },
		lualine_b = {
			{ "branch", icon = "" },
			{ "diff", color_added = "#a7c080", color_modified = "#ffdf1b", color_removed = "#ff6666" },
		},
		lualine_c = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = "●", warn = "●", info = "●", hint = "●" },
			},
			require("auto-session-library").current_session_name,
			function()
				return "%="
			end,
			"filename",
			{ getWords },
		},
		lualine_x = { "filetype", "encoding" },
		lualine_y = {
			{
				"progress",
			},
		},
		lualine_z = {
			{
				"location",
				icon = "",
			},
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
