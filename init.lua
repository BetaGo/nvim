-- dev
require("settings")
require("global-conf")
require("lazy-conf")
require("neovide")
require("custom-command")

if vim.g.vscode then
	require("vscode.keymap")
	require("vscode.config")
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

-- some special filetype
vim.cmd([[
    augroup CustomFileType
    autocmd!
        autocmd BufNewFile,BufRead *.lepus set filetype=javascript
        autocmd BufNewFile,BufRead *.ttml set filetype=html
    augroup END
]])
