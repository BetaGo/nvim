local wk = require("which-key")
wk.setup({})

wk.register({
	c = {
		name = "code",
		l = { "<cmd>SymbolsOutline<cr>", "Show SymbolsOutline" },
		e = { "<cmd>lua require('telescope.builtin').diagnostics()<cr>", "show diagnositics for all open buffers" },
	},
}, { prefix = "<leader>" })

wk.register({
	f = {
		name = "file",
		f = { "<cmd>lua vim.lsp.buf.format()<cr>", "format current file" },
		d = { "<cmd>DiffChangesDiffToggle<cr>", "show current file diff changes with saved" },
		b = { "<cmd>Telescope file_browser<cr>", "show telescope file browser" },
	},
}, { prefix = "<leader>" })

wk.register({
	s = {
		name = "search",
		b = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "fuzzy search current file" },
		f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "find files, search files" },
		s = {
			"<cmd>lua require('telescope.builtin').live_grep()<cr>",
			"search for a string in current working directory",
		},
	},
}, { prefix = "<leader>" })

wk.register({
	g = {
		name = "git",
		c = { "<cmd>lua require('telescope.builtin').git_commits()<cr>", "list git commits with diff preview" },
		b = { "<cmd>lua require('telescope.builtin').git_branches()<cr>", "list all branches with log preview" },
		g = { "<cmd>LazyGit<cr>", "show lazygit" },
	},
}, { prefix = "<leader>" })

local chatgpt = require("chatgpt")
wk.register({
	p = {
		name = "ChatGPT",
		e = {
			function()
				chatgpt.edit_with_instructions()
			end,
			"Edit with instructions",
		},
	},
}, {
	prefix = "<leader>",
	mode = "v",
})
