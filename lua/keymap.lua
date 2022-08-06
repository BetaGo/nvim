--Remap space as leader key
-- vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_set_keymap(
	"i",
	"jj",
	"<Esc>",
	{ noremap = true, silent = true }
)
-- terminal

-- vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

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

-- nvim tree
vim.api.nvim_set_keymap(
	"n",
	"<leader>r",
	[[<cmd>NvimTreeRefresh<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>n",
	[[<cmd>NvimTreeFindFile<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-n>",
	[[<cmd>NvimTreeToggle<CR>]],
	{ noremap = true, silent = true }
)

-- bufferline
vim.api.nvim_set_keymap("n", "[b", [[ <cmd> BufferLineCyclePrev<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "]b", [[ <cmd> BufferLineCycleNext<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gb", [[ <cmd> BufferLinePick <CR>]], { noremap = true, silent = true })
