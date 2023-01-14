require("nvim-tree").setup({
	view = {
		side = "right",
	},
	update_focused_file = {
		enable = true,
		update_root = true,
	},

	renderer = {
		indent_markers = {
			enable = true,
		},
	},
	diagnostics = {
		enable = true,
	},
})
