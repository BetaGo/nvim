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
	function! RunImSwitch()
		" Check if im-select command exists
		if system('command -v im-select >/dev/null') == 0
			silent !im-select com.apple.keylayout.ABC
		endif
		if system('command -v im-select >/dev/null') == 0
			silent !macism com.apple.keylayout.ABC
		endif
	endfunction
	augroup ImSwitch
		autocmd!
		autocmd InsertLeave * call RunImSwitch()
	augroup END
]])
