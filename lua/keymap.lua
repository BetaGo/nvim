local wk = require("which-key")
--Remap space as leader key
-- vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("i", "kk", "<Esc>", { noremap = true, silent = true })

--Remap for dealing with word wrap
-- vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
-- vim.api.nvim_set_keymap("v", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap("v", "k", "gk", { noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap("v", "j", "gj", { noremap = true, expr = false, silent = true })

vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

-- obsidian
vim.keymap.set("n", "gf", function()
	if require("obsidian").util.cursor_on_markdown_link() then
		return "<cmd>ObsidianFollowLink<CR>"
	else
		return "gf"
	end
end, { noremap = false, expr = true })

wk.register({
	["<leader><leader>"] = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "show buffers" },
})

wk.register({
	["<leader>xe"] = {
		"<cmd>lua require('nvim-emmet').wrap_with_abbreviation()<CR>",
		"wrap with abbreviation",
	},
}, {
	mode = { "n", "v" },
})

wk.register({
	["<leader>e"] = {
		"<cmd>ZenMode<CR>",
		"Toggle Zen Mode",
	},
}, {
	mode = { "n", "v" },
})

wk.register({
	c = {
		name = "ChatGPT & Change",
		c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
		e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
		-- g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
		-- t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
		-- k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
		-- d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
		-- o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
		-- s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
		-- f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
		-- x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
		-- r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
		-- l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
		p = { "<cmd>ChatGPTRun en2zh<CR>", "Translate English Paragraph to Chinese", mode = { "n", "v" } },
		w = { "<cmd>ChatGPTRun trans_word<CR>", "Translate English word to Chinese", mode = { "n", "v" } },
	},
}, { prefix = "<leader>" })

wk.register({
	f = {
		name = "file",
		f = { "<cmd>Format<cr>", "format current file or selection" },
		d = { "<cmd>DiffChangesDiffToggle<cr>", "show current file diff changes with saved" },
		-- b = { "<cmd>Telescope file_browser<cr>", "show Telescope file browser" },
		b = { "<cmd>Neotree toggle<cr>", "show Neotree file browser" },
		c = {
			"<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
			"open file browser with the path of the current buffer",
		},
	},
}, { prefix = "<leader>" })

wk.register({
	s = {
		name = "search file or docs",
		c = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "fuzzy search current file" },
		f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "find files, search files" },
		s = {
			"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
			"search for a string in current working directory",
		},
		d = {
			"<cmd>Telescope dir live_grep<CR>",
			"live grep in spaecial dir",
		},
		k = {
			"<cmd>DevdocsOpenCurrentFloat<CR>",
			"Open documentation for the current filetype in a floating window",
		},
		w = {
			"<cmd>DevdocsOpenFloat<CR>",
			"Open documentation in a floating window",
		},
		r = {
			"<cmd>lua require('telescope.builtin').oldfiles()<cr>",
			"Lists previously open files",
		},
		p = { '<cmd>lua require("spectre").toggle()<CR>', "Toggle Spectre, Search & replace text" },
	},
}, { prefix = "<leader>" })

wk.register({
	g = {
		name = "git & generate",
		g = { "<cmd>LazyGit<cr>", "Show lazygit" },
		d = { "<cmd>lua require('neogen').generate()<cr>", "Generate Docs use neogen" },
		c = {
			name = " □  Boxes",
			b = { "<Cmd>CBccbox<CR>", "Box Title" },
			t = { "<Cmd>CBllline<CR>", "Titled Line" },
			l = { "<Cmd>CBline<CR>", "Simple Line" },
			m = { "<Cmd>CBllbox14<CR>", "Marked" },
			d = { "<Cmd>CBd<CR>", "Remove a box" },
		},
	},
}, { prefix = "<leader>" })

-- only in t mode
wk.register({
	["<Esc><Esc>"] = { "<C-\\><C-n>", "exit form terminal input mode" },
}, {
	mode = "t",
})

wk.register({
	["s"] = { "<cmd>Say<cr>", "Say selected text" },
}, {
	mode = "v",
	prefix = "<leader>",
})

-- for nvim dap
wk.register({
	d = {
		name = "Debug",
		R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
		E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
		C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
		U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
		b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
		e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
		g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
		h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
		S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
		p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
		q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
		s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
		t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
		x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
		u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
		l = { "<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<cr>", "List Breakpoints" },
	},
}, {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
})
