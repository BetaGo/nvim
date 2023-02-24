require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		separator_style = "thin",
		numbers = "ordinal",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		indicator = {
			style = "icon",
		},
		offsets = {
			{
				filetype = "NvimTree",
				text = function()
					return vim.fn.getcwd()
				end,
				highlight = "Directory",
				text_align = "left",
			},
		},
	},
})
