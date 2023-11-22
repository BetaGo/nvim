local wk = require("which-key")
wk.setup({
	window = {
		-- border = "single",  -- none, single, double, shadow
		border = "none", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
		padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
		zindex = 1000, -- positive value to position WhichKey above other floating windows.
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
})
-- vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "NONE", fg = "NONE" })
-- vim.api.nvim_set_hl(0, "WhichKeyBorder", { bg = "NONE" })

wk.register({
	["<leader><leader>"] = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "show buffers" },
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
		f = { "<cmd>lua require('conform').format({async = true, lsp_fallback = true })<cr>", "format current file" },
		d = { "<cmd>DiffChangesDiffToggle<cr>", "show current file diff changes with saved" },
		b = { "<cmd>Telescope file_browser<cr>", "show Telescope file browser" },
		c = {
			"<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
			"open file browser with the path of the current buffer",
		},
	},
}, { prefix = "<leader>" })

wk.register({
	l = {
		name = "Language Actions",
		r = { "<cmd>Telescope lsp_references<cr>", "Lists LSP references for word under the cursor" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "LSP code action" },
		i = { "<cmd>Telescope lsp_incoming_calls<cr>", "Lists LSP incoming calls for word under the cursor" },
		o = { "<cmd>Telescope lsp_outgoing_calls<cr>", "Lists LSP outgoing calls for word under the cursor" },
		l = { "<cmd>SymbolsOutline<cr>", "Toggle symbols outline" },
		q = {
			"<cmd>lua require('trouble').toggle('document_diagnostics')<cr>",
			"document diagnostics from the builtin LSP client",
		},
		e = {
			"<cmd>lua require('trouble').toggle('workspace_diagnostics')<cr>",
			"workspace diagnostics from the builtin LSP client",
		},
		d = {
			"<cmd>Telescope lsp_definitions<cr>",
			"Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope",
		},
		w = {
			"<cmd>Telescope spell_suggest<cr>",
			"Lists spelling suggestions for the current word under the cursor, replaces word with selected suggestion on <cr>",
		},
	},
}, { prefix = "<leader>" })

wk.register({
	s = {
		name = "search file or docs",
		c = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "fuzzy search current file" },
		f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "find files, search files" },
		s = {
			"<cmd>lua require('telescope.builtin').live_grep()<cr>",
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
	},
}, { prefix = "<leader>" })

wk.register({
	S = { '<cmd>lua require("spectre").toggle()<CR>', "Toggle Spectre, Search & replace text" },
}, { prefix = "<leader>" })

wk.register({
	g = {
		name = "git & generate",
		g = { "<cmd>LazyGit<cr>", "Show lazygit" },
		d = { "<cmd>lua require('neogen').generate()<cr>", "Generate Docs use neogen" },
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
