local opts = { noremap = true, silent = true }
--local keymaps = {
--	{ "<C-n>", ":NvimTreeToggle<CR>", description = "NvimTreeToggle", opts = opts },
--	{ "<leader>r", ":NvimTreeRefresh<CR>", description = "NvimTreeRefresh", opts = opts },
--	{ "<leader>n", ":NvimTreeFindFile<CR>", description = "NvimTreeFindFile", opts = opts },
--	--Add leader shortcuts
--	{
--		"<leader><space>",
--		":Legendary<CR>",
--		description = "legendary commands",
--		{ noremap = true, silent = true },
--	},
--	{

--		"<leader>sf",
--		":lua require('telescope.builtin').find_files({previewer = false})<CR>",
--		description = "show telescope files",
--		{ noremap = true, silent = true },
--	},
--	{

--		"<leader>sb",
--		":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
--		description = "show telescope current buffer fuzzy find",
--		{ noremap = true, silent = true },
--	},
--	{

--		"<leader>sh",
--		":lua require('telescope.builtin').help_tags()<CR>",
--		description = "show telescope help tags",
--		{ noremap = true, silent = true },
--	},
--	{

--		"<leader>ss",
--		":lua require('telescope.builtin').lsp_document_symbols()<CR>",
--		description = "show telescope lsp document symbols",
--		{ noremap = true, silent = true },
--	},
--	{

--		"<leader>sr",
--		":lua require('telescope.builtin').lsp_references()<CR>",
--		description = "show telescope lsp references",
--		{ noremap = true, silent = true },
--	},
--	{

--		"<leader>sd",
--		":lua require('telescope.builtin').grep_string()<CR>",
--		description = "show telescope grep string",
--		{ noremap = true, silent = true },
--	},
--	{

--		"<leader>sp",
--		":lua require('telescope.builtin').live_grep()<CR>",
--		description = "show telescope live grep",
--		{ noremap = true, silent = true },
--	},
--	{

--		"<leader>?",
--		":lua require('telescope.builtin').oldfiles()<CR>",
--		description = "show telescope oldfiles",
--		{ noremap = true, silent = true },
--	},

--	-- bufferline
--	{
--		"[b",
--		":BufferLineCyclePrev<CR>",
--		description = "buffer line cycle prev",
--		{ noremap = true, silent = true },
--	},
--	{
--		"]b",
--		":BufferLineCycleNext<CR>",

--		description = "buffer line cycle next",
--		{ noremap = true, silent = true },
--	},
--	{
--		"gb",
--		":BufferLinePick <CR>",
--		description = "buffer line pick",
--		{ noremap = true, silent = true },
--	},
--}
require("legendary").setup({

})
