-- download config
vim.g.download_plugin_use_ssh = true

if vim.g.vscode then
	print("run in vscode")
else
	require("settings")
	require("keymap")
	require("packer-conf")
	require("custom-theme")

	require("plugins.neovide")
	require("plugins.nvim-notify")

	require("plugins.airline")
	require("plugins.bufferline")
	require("plugins.todo-comments")
	require("plugins.dressing")
	require("plugins.indent-blankline")
	require("plugins.neoformat")
	require("plugins.nvim-tree")
	require("plugins.nvim-treesitter")
	require("plugins.pretty-fold")
	require("plugins.symbols-outline")
	require("plugins.telescope")
    require("plugins.trouble")
	require("plugins.vim-fugitive")

	-- Order is required
	require("plugins.legendary")
	require("plugins.which-key")

	require("lsp")
end

-- Highlight on yank
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

