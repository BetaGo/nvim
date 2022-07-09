-- Telescope
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				-- ["<C-u>"] = false,
				-- ["<C-d>"] = false,
                ["<C-h>"] = "which_key"
			},
		},
	},
})

