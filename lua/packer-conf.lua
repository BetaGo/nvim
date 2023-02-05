-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	if vim.g.download_plugin_use_ssh == true then
		vim.fn.execute("!git clone git@github.com:wbthomason/packer.nvim " .. install_path)
	else
		vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	end
end

local default_url_format = vim.g.download_plugin_use_ssh and "git@github.com:%s" or "https://github.com/%s"
local not_in_vscode = true
if vim.g.vscode then
	not_in_vscode = false
end

local use = require("packer").use
require("packer").startup({
	function()
		use("wbthomason/packer.nvim") -- Package manager
		use({ "kdheepak/lazygit.nvim", cond = not_in_vscode })
		use("tpope/vim-commentary") -- "gc" to comment visual regions/lines
		use({ "JoosepAlviste/nvim-ts-context-commentstring", cond = not_in_vscode }) -- jsx comment support
		-- UI to select things (files, grep results, open buffers...)
		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			cond = not_in_vscode,
			config = function()
				require("plugins.telescope")
			end,
		})
		use({
			"shaunsingh/nord.nvim",
			-- "arcticicestudio/nord-vim",
			config = function()
				require("custom-theme")
			end,
		}) -- theme packages
		-- Add indentation guides even on blank lines
		use({ "lukas-reineke/indent-blankline.nvim", cond = not_in_vscode })
		-- Highlight, edit, and navigate code using a fast incremental parsing library
		use({
			"nvim-treesitter/nvim-treesitter",
			config = function()
				require("plugins.nvim-treesitter")
			end,
		})
		-- Additional textobjects for treesitter
		use({ "nvim-treesitter/nvim-treesitter-textobjects" })
		use({
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		}) -- Collection of configurations for built-in LSP client
		use({
			"kyazdani42/nvim-tree.lua",
			requires = { "kyazdani42/nvim-web-devicons" },
			cond = not_in_vscode,
			config = function()
				require("plugins.nvim-tree")
			end,
		})
		use({
			"akinsho/bufferline.nvim",
			tag = "v3.*",
			requires = "kyazdani42/nvim-web-devicons",
			cond = not_in_vscode,
			config = function()
				require("plugins.bufferline")
			end,
		})
		use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim", cond = not_in_vscode })
		use({ "kassio/neoterm", cond = not_in_vscode })
		use({
			"sbdchd/neoformat",
			cond = not_in_vscode,
			config = function()
				require("plugins.neoformat")
			end,
		})
		use({
			"nvim-lualine/lualine.nvim",
			cond = not_in_vscode,
			config = function()
				require("plugins.lualine")
			end,
		})
		use({
			"simrat39/symbols-outline.nvim",
			cond = not_in_vscode,
			config = function()
				require("plugins.symbols-outline")
			end,
		})
		use({ "stevearc/dressing.nvim", cond = not_in_vscode })
		use({
			"folke/which-key.nvim",
			cond = not_in_vscode,
			config = function()
				require("plugins.which-key")
			end,
		})
		use({ "lambdalisue/suda.vim" }) -- open & write file as sudo
		use({
			"rcarriga/nvim-notify",
			cond = not_in_vscode,
			config = function()
				require("plugins.nvim-notify")
			end,
		})
		use({
			"goolord/alpha-nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			cond = not_in_vscode,
			config = function()
				require("plugins.alpha")
			end,
		}) -- greeter for neovim
		use({ "jmcantrell/vim-diffchanges", cond = not_in_vscode }) -- diff local changes
		use({
			"anuvyklack/pretty-fold.nvim",
			cond = not_in_vscode,
			config = function()
				require("plugins.pretty-fold")
			end,
		})
		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			cond = not_in_vscode,
			config = function()
				require("plugins.todo-comments")
			end,
		})
		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			cond = not_in_vscode,
			config = function()
				require("plugins.trouble")
			end,
		}) -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
		use({
			"nmac427/guess-indent.nvim",
			cond = not_in_vscode,
			config = function()
				require("plugins.guess-indent")
			end,
		})
		use({
			"lewis6991/spellsitter.nvim",
			cond = not_in_vscode,
			config = function()
				require("plugins.spellsitter")
			end,
		})
		use({ "ap/vim-css-color", cond = not_in_vscode })
		use({
			"unblevable/quick-scope",
			config = function()
				require("plugins.quick-scope")
			end,
		})
	end,
	config = {
		git = {
			default_url_format = default_url_format,
		},
	},
})
