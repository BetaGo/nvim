require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		separator_style = "thick",
		numbers = "ordinal",
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

