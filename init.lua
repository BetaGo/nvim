-- download config
vim.g.download_plugin_use_ssh = true

if vim.g.vscode then
	print("run in vscode")
else
	require("settings")
	require("keymap")
	require("packer-conf")
	require("custom-theme")

	require("plugins.bufferline")
	require("plugins.dressing")
	require("plugins.indent-blankline")
	require("plugins.legendary")
	require("plugins.neoformat")
	require("plugins.nvim-tree")
	require("plugins.nvim-treesitter")
	require("plugins.symbols-outline")
	require("plugins.telescope")
	require("plugins.vim-fugitive")
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
