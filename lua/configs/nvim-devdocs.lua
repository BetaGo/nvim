local border_style = require("user-conf").nui_border_style

require("nvim-devdocs").setup({
	-- previewer_cmd = "glow",
	-- cmd_args = { "-s", "dracula", "-w", "80" },
	wrap = true,
	picker_cmd = true,
	float_win = { -- passed to nvim_open_win(), see :h api-floatwin
		relative = "editor",
		height = 50,
		width = 100,
		border = border_style,
	},
	-- picker_cmd_args = { "-s", vim.o.background, "-w", "70" },
	after_open = function(bufnr)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<Esc>", ":close<CR>", {})
	end,
})
