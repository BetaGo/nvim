local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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

local nocode = function()
	return vim.fn.exists("g:vscode") == 0
end

require("lazy").setup({
	{ "kdheepak/lazygit.nvim",                       cond = nocode },
	{ "tpope/vim-commentary",                        cond = nocode },
	{ "JoosepAlviste/nvim-ts-context-commentstring", cond = nocode },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cond = nocode,
		config = function()
			require("plugins.telescope")
		end,
	},
	{
		"sainnhe/edge",
		cond = nocode,
		config = function()
			require("custom-theme")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		cond = nocode,
		config = function()
			require("plugins.indent-blankline")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		cond = nocode,
		config = function()
			require("plugins.nvim-treesitter")
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects", cond = nocode },
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
		cond = nocode,
	},
	{ "williamboman/mason-lspconfig.nvim",           cond = nocode },
	{ "neovim/nvim-lspconfig",                       cond = nocode },
	{
		"jose-elias-alvarez/null-ls.nvim",
		cond = nocode,
		config = function()
			require("plugins.null-ls")
		end,
	},
	{ "hrsh7th/cmp-nvim-lsp",     cond = nocode },
	{ "hrsh7th/cmp-buffer",       cond = nocode },
	{ "hrsh7th/cmp-path",         cond = nocode },
	{ "hrsh7th/cmp-cmdline",      cond = nocode },
	{ "hrsh7th/nvim-cmp",         cond = nocode },
	{ "saadparwaiz1/cmp_luasnip", cond = nocode },
	{ "L3MON4D3/LuaSnip",         cond = nocode },
	{ "rcarriga/nvim-dap-ui",     cond = nocode, dependencies = { "mfussenegger/nvim-dap" } },
	{
		"folke/neodev.nvim",
		cond = nocode,
		config = function()
			require("plugins.neodev")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		cond = nocode,
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "kyazdani42/nvim-web-devicons",
		cond = nocode,
		config = function()
			require("plugins.bufferline")
		end,
	},
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim", cond = nocode },
	{ "kassio/neoterm",         cond = nocode },
	{
		"nvim-lualine/lualine.nvim",
		cond = nocode,
		config = function()
			require("plugins.lualine")
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		cond = nocode,
		config = function()
			require("plugins.symbols-outline")
		end,
	},
	{ "stevearc/dressing.nvim", cond = nocode },
	{
		"folke/which-key.nvim",
		cond = nocode,
		config = function()
			require("plugins.which-key")
		end,
	},
	{ "lambdalisue/suda.vim" },
	-- {
	-- 	"rcarriga/nvim-notify",
	-- 	cond = nocode,
	-- 	config = function()
	-- 		require("plugins.nvim-notify")
	-- 	end,
	-- },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		cond = nocode,
		config = function()
			require("plugins.noice")
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		cond = nocode,
		config = function()
			require("plugins.alpha")
		end,
	},
	{ "jmcantrell/vim-diffchanges", cond = nocode },
	{
		"anuvyklack/pretty-fold.nvim",
		cond = nocode,
		config = function()
			require("plugins.pretty-fold")
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		cond = nocode,
		config = function()
			require("plugins.todo-comments")
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		cond = nocode,
		config = function()
			require("plugins.trouble")
		end,
	},
	{
		"nmac427/guess-indent.nvim",
		cond = nocode,
		config = function()
			require("plugins.guess-indent")
		end,
	},
	{
		"unblevable/quick-scope",
	},
	{
		"BetaGo/nvim-colorizer.lua",
		cond = nocode,
		config = function()
			require("plugins.nvim-colorizer")
		end,
	},
})
