require("lualine").setup({
	options = {
		icons_enabled = true,
		-- theme = "everforest",
		theme = "catppuccin",
		component_separators = "|",

		-- section_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = {
			{
				"fileformat",
				symbols = {
					unix = "", -- e712
					dos = "", -- e70f
					mac = "", -- e711
				},
				separator = { left = "" },
			},
			{ "mode" },
		},
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			"filename",
		},
		lualine_x = {
			{
				"rest",
				icon = "",
				fg = "#428890",
			},
			{
				require("noice").api.status.command.get,
				cond = require("noice").api.status.command.has,
				-- color = { fg = "#ff9e64" },
			},
			"encoding",
			"hostname",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "selectioncount", { "location", separator = { right = "" }, left_padding = 2 } },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	-- tabline = {
	--   lualine_a = {},
	--   lualine_b = {},
	--   lualine_c = { require("tabline").tabline_buffers },
	--   lualine_x = { require("tabline").tabline_tabs },
	--   lualine_y = {},
	--   lualine_z = {},
	-- },
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
