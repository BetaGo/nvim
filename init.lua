-- dev
require("settings")
require("global-conf")
require("lazy-conf")
require("filetype-detect")
require("neovide")
if vim.g.vscode then
	require("vscode.keymap")
	require("vscode.config")
	vim.cmd([[
	  highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
	  highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
	]])
else
	require("keymap")
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
		if system('command -v macism >/dev/null') == 0
			silent !macism com.apple.keylayout.ABC
		endif
	endfunction
	augroup ImSwitch
		autocmd!
		autocmd InsertLeave * call RunImSwitch()
	augroup END
]])
