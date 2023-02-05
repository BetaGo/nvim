-- download config
vim.g.download_plugin_use_ssh = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("settings")

if vim.g.vscode then
	require("vscode.keymap")
	vim.cmd([[
	  highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
	  highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
	]])
else
	require("packer-conf")
	require("keymap")
	require("custom-theme")

	require("plugins.neovide")
	require("plugins.vim-fugitive")

	require("lsp")
end

-- Highlight on yank
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

