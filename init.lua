-- download config
vim.g.download_plugin_use_ssh = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("settings")
require("packer-conf")
if vim.g.vscode then
	require("vscode.keymap")
	vim.cmd([[
	  highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
	  highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
	]])
else
	require("keymap")
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

-- auto im-switch
vim.cmd([[
	autocmd InsertLeave * :silent !im-select com.apple.keylayout.ABC
]])
