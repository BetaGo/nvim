--Remap space as leader key
-- vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- navigate
vim.api.nvim_set_keymap(
	"n",
	"<C-w>h",
	[[<cmd>call VSCodeNotify('workbench.action.navigateLeft')<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"x",
	"<C-w>h",
	[[<cmd>call VSCodeNotify('workbench.action.navigateLeft)<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-w>l",
	[[<cmd>call VSCodeNotify('workbench.action.navigateRight
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"x",
	"<C-w>l",
	[[<cmd>call VSCodeNotify('workbench.action.navigateRight)<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-w>j",
	[[<cmd>call VSCodeNotify('workbench.action.navigateDown')<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"x",
	"<C-w>j",
	[[<cmd>call VSCodeNotify('workbench.action.navigateDown)<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-w>k",
	[[<cmd>call VSCodeNotify('workbench.action.navigateUp')<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"x",
	"<C-w>k",
	[[<cmd>call VSCodeNotify('workbench.action.navigateUp)<CR>]],
	{ noremap = true, silent = true }
)


-- other map
vim.api.nvim_set_keymap(
	"n",
	"gr",
	[[<cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"x",
	"gr",
	[[<cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>rn",
	[[<cmd>call VSCodeNotify('editor.action.rename')<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"x",
	"<leader>rn",
	[[<cmd>call VSCodeNotify('editor.action.rename')<CR>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>cl",
	[[<cmd>call VSCodeNotify('workbench.action.showAllSymbols')<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"x",
	"<leader>cl",
	[[<cmd>call VSCodeNotify('workbench.action.showAllSymbols')<CR>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>ca",
	[[<cmd>call VSCodeNotify('editor.action.quickFix')<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"x",
	"<leader>ca",
	[[<cmd>call VSCodeNotify('editor.action.quickFix')<CR>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>ss",
	[[<cmd>call VSCodeNotify('workbench.view.search')<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"x",
	"<leader>ss",
	[[<cmd>call VSCodeNotify('workbench.view.search')<CR>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader><space>",
	[[<cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"x",
	"<leader><space>",
	[[<cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>]],
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>sf",
	[[<cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"x",
	"<leader>sf",
	[[<cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>]],
	{ noremap = true, silent = true }
)

-- fold ubfold
vim.api.nvim_set_keymap(
	"n",
	"zc",
	[[<cmd>call VSCodeNotify('editor.fold')<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"x",
	"zc",
	[[<cmd>call VSCodeNotify('editor.fold')<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"zo",
	[[<cmd>call VSCodeNotify('editor.unfold')<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"x",
	"zo",
	[[<cmd>call VSCodeNotify('editor.unfold')<CR>]],
	{ noremap = true, silent = true }
)

-- Commentary
vim.api.nvim_set_keymap(
	"x",
	"gc",
	[[<cmd><Plug>VSCodeCommentary<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"gc",
	[[<cmd><Plug>VSCodeCommentary<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"o",
	"gc",
	[[<cmd><Plug>VSCodeCommentary<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"gcc",
	[[<cmd><Plug>VSCodeCommentaryLine<CR>]],
	{ noremap = true, silent = true }
)
