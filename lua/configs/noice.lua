require("noice").setup({
	views = {
		cmdline_popup = {
			border = {
				style = "single",
			},
			position = {
				row = 5,
				col = "50%",
			},
			size = {
				width = 60,
				height = "auto",
			},
		},
		hover = {
			border = {
				style = "single",
			},
		},
		popupmenu = {
			relative = "editor",
			position = {
				row = 8,
				col = "50%",
			},
			size = {
				width = 60,
				height = 10,
			},
			border = {
				style = "single",
				padding = { 0, 1 },
			},
			win_options = {
				winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
			},
		},
	},
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
		hover = {
			enable = true,
			silent = true,
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = false, -- use a classic bottom cmdline for search
		command_palette = false, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = true, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = true, -- add a border to hover docs and signature help
	},
	-- routes = {
	--   filter = {
	--     event = "notify",
	--     find = "No information available",
	--   },
	--   opts = { stop = true },
	-- },
})

require("notify").setup({
	render = "wrapped-compact",
	on_open = function(win)
		local config = vim.api.nvim_win_get_config(win)
		config.border = "single"
		vim.api.nvim_win_set_config(win, config)
	end,
})
