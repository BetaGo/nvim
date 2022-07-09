--Remap space as leader key
-- vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- terminal

vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

--Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

--Add leader shortcuts
vim.api.nvim_set_keymap(
	"n",
	"<leader><space>",
	[[<cmd>lua require('telescope.builtin').buffers()<CR>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>sb",
	[[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sh",
	[[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>ss",
	[[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sr",
	[[<cmd>lua require('telescope.builtin').lsp_references()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sd",
	[[<cmd>lua require('telescope.builtin').grep_string()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sp",
	[[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
	{ noremap = true, silent = true }
)

-- legendary
vim.api.nvim_set_keymap("n", "<leader>?", [[<cmd> Legendary<CR>]], { noremap = true, silent = true })

-- bufferline
vim.api.nvim_set_keymap("n", "[b", [[ <cmd> BufferLineCyclePrev<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "]b", [[ <cmd> BufferLineCycleNext<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gb", [[ <cmd> BufferLinePick <CR>]], { noremap = true, silent = true })
