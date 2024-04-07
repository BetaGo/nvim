local wk = require("which-key")

--Remap space as leader key
-- vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("", "<Space>", "<Nop>") -- https://github.com/vscode-neovim/vscode-neovim/issues/1137#issuecomment-1936954633
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap("v", "k", "gk", { noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, expr = false, silent = true })
vim.api.nvim_set_keymap("v", "j", "gj", { noremap = true, expr = false, silent = true })

wk.register({
	g = {
		name = "generate",
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
	[[<cmd>call VSCodeNotify('workbench.action.navigateRight]],
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
vim.api.nvim_set_keymap("n", "zc", [[<cmd>call VSCodeNotify('editor.fold')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "zc", [[<cmd>call VSCodeNotify('editor.fold')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "zo", [[<cmd>call VSCodeNotify('editor.unfold')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "zo", [[<cmd>call VSCodeNotify('editor.unfold')<CR>]], { noremap = true, silent = true })

-- Commentary
vim.api.nvim_set_keymap("x", "gc", [[<Plug>VSCodeCommentary]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gc", [[<Plug>VSCodeCommentary]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("o", "gc", [[<Plug>VSCodeCommentary]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gcc", [[<Plug>VSCodeCommentaryLine]], { noremap = true, silent = true })
