-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
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

local augroup = vim.api.nvim_create_augroup("numbertoggle", {})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
	pattern = "*",
	group = augroup,
	callback = function()
		if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
			vim.opt.relativenumber = true
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
	pattern = "*",
	group = augroup,
	callback = function()
		if vim.o.nu then
			vim.opt.relativenumber = false
			vim.cmd("redraw")
		end
	end,
})
