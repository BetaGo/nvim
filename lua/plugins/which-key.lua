local wk = require("which-key")
wk.setup({
	window = {
		-- border = "single",  -- none, single, double, shadow
		border = "none",    -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
		padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,       -- value between 0-100 0 for fully opaque and 100 for fully transparent
		zindex = 1000,      -- positive value to position WhichKey above other floating windows.
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3,              -- spacing between columns
		align = "left",           -- align columns left, center or right
	},
})
-- vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "NONE", fg = "NONE" })
-- vim.api.nvim_set_hl(0, "WhichKeyBorder", { bg = "NONE" })

wk.register({
	["<leader><leader>"] = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "show buffers" },
})

wk.register({
	c = {
		name = "ChatGPT",
		c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
		e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
		g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
		t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
		k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
		d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
		a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
		o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
		s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
		f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
		x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
		r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
		l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
	},
}, { prefix = "<leader>" })

wk.register({
	f = {
		name = "file",
		f = { "<cmd>lua require('plugins.neoformat').format()<cr>", "format current file" },
		d = { "<cmd>DiffChangesDiffToggle<cr>", "show current file diff changes with saved" },
		b = { "<cmd>Telescope file_browser<cr>", "show telescope file browser" },
		c = {
			"<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
			"open file browser with the path of the current buffer",
		},
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
		d = {
			"<cmd>Telescope dir live_grep<CR>",
			"live grep in spaecial dir",
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

-- only in t mode
wk.register({
	["<Esc><Esc>"] = { "<C-\\><C-n>", "exit form terminal input mode" },
}, {
	mode = "t",
})
