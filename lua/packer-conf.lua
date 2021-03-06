-- Install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	if vim.g.download_plugin_use_ssh == true then
		vim.fn.execute("!git clone git@github.com:wbthomason/packer.nvim " .. install_path)
	else
		vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	end
end

vim.cmd([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]])

local default_url_format = vim.g.download_plugin_use_ssh and "git@github.com:%s" or "https://github.com/%s"

local use = require("packer").use
require("packer").startup({
	function()
		use("wbthomason/packer.nvim") -- Package manager
		use("tpope/vim-fugitive") -- Git commands in nvim
		use("kdheepak/lazygit.nvim")
		use("tpope/vim-rhubarb") -- Fugitive-companion to interact with github
		use("tpope/vim-commentary") -- "gc" to comment visual regions/lines
		-- UI to select things (files, grep results, open buffers...)
		use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
		use("arcticicestudio/nord-vim")
		use("joshdick/onedark.vim")
		use("sainnhe/everforest")
		use("folke/tokyonight.nvim")
		-- Add indentation guides even on blank lines
		use("lukas-reineke/indent-blankline.nvim")
		-- Highlight, edit, and navigate code using a fast incremental parsing library
		use("nvim-treesitter/nvim-treesitter")
		-- Additional textobjects for treesitter
		use("nvim-treesitter/nvim-treesitter-textobjects")
		use({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" }) -- Collection of configurations for built-in LSP client
		use("hrsh7th/nvim-cmp") -- Autocompletion plugin
		use("hrsh7th/cmp-nvim-lsp")
		use("saadparwaiz1/cmp_luasnip")
		use("L3MON4D3/LuaSnip") -- Snippets plugin
		use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })
		use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
		use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
		use({ "kassio/neoterm" })
		use({ "sbdchd/neoformat" })
		use({ "vim-airline/vim-airline" })
		use({ "simrat39/symbols-outline.nvim" })
		use({ "stevearc/dressing.nvim" })
		use({ "folke/which-key.nvim" })
		use({ "mrjones2014/legendary.nvim" })
		use({ "lambdalisue/suda.vim" }) -- open & write file as sudo
		use("rcarriga/nvim-notify")
		use({
			"goolord/alpha-nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("alpha").setup(require("alpha.themes.startify").config)
			end,
		}) -- greeter for neovim
		use("jmcantrell/vim-diffchanges") -- diff local changes
		use({ "anuvyklack/pretty-fold.nvim" })
		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
		})
		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
		})
		use({ "nmac427/guess-indent.nvim" })
	end,
	config = {
		git = {
			default_url_format = default_url_format,
		},
	},
})
