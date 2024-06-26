-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

require("settings")

-- local config
pcall(require, "local.settings")

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = require("plugins")

local has_local_plugin, local_plugins = pcall(require, "local.plugins")
if has_local_plugin then
	for _, v in ipairs(local_plugins) do
		table.insert(plugins, v)
	end
end

require("lazy").setup(plugins, {
	dev = {
		-- directory where you store your local plugin projects
		path = require("user-conf").workspace_path,
		---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
		patterns = {}, -- For example {"folke"}
		fallback = false, -- Fallback to git when local plugin doesn't exist
	},
})

require("command")
require("autocmd")
require("theme")

-- gui config
require("gui.neovide")
if vim.g.vscode then
	require("gui.vscode.keymap")
	require("gui.vscode.config")
else
	require("keymap")
	require("lsp")
end
