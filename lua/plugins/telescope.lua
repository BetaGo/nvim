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
	extensions = {
		 file_browser = {
		  -- theme = "dropdown",
		  -- disables netrw and use telescope-file-browser in its place
		  hijack_netrw = true,
		  mappings = {
			["i"] = {
			  -- your custom insert mode mappings
			},
			["n"] = {
			  -- your custom normal mode mappings
			},
		  },
    },
	}
})

require("telescope").load_extension "file_browser"
