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

local incode = function()
	return vim.fn.exists("g:vscode") ~= 0
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
		"nvim-telescope/telescope-file-browser.nvim",
		cond = nocode,
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{ "princejoogie/dir-telescope.nvim" },
	{
		"BetaGo/everforest-nvim",
		cond = nocode,
		priority = 1000,
		config = function()
			require("custom-theme")
		end

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
		-- cond = nocode,
		config = function()
			require("plugins.nvim-treesitter")
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects",
		-- cond = nocode
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
		cond = nocode,
	},
	{ "williamboman/mason-lspconfig.nvim", cond = nocode },
	{ "neovim/nvim-lspconfig",             cond = nocode },
	{
		"sbdchd/neoformat",
		config = function()
			require("plugins.neoformat")
		end
	},
	{ "hrsh7th/cmp-nvim-lsp", cond = nocode },
	{ "hrsh7th/cmp-buffer",   cond = nocode },
	{ "hrsh7th/cmp-path",     cond = nocode },
	{ "hrsh7th/cmp-calc",     cond = nocode },
	{ "hrsh7th/cmp-emoji",    cond = nocode },
	{ "ray-x/cmp-treesitter", cond = nocode },
	{
		"hrsh7th/nvim-cmp",
		cond = nocode,

		config = function()
			require("plugins.nvim-cmp")
		end,
	},
	{ "saadparwaiz1/cmp_luasnip", cond = nocode },
	{
		"L3MON4D3/LuaSnip",
		cond = nocode,
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "2.*",
		build = "make install_jsregexp",
		config = function()
			require("plugins.luasnip")
		end,
	},
	{
		"mfussenegger/nvim-dap",
		cond = nocode,
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-telescope/telescope-dap.nvim",
			"mfussenegger/nvim-dap-python",
			"jay-babu/mason-nvim-dap.nvim"
		},
		config = function()
			require("plugins.nvim-dap")
		end,
	},
	-- {
	-- 	"mxsdev/nvim-dap-vscode-js",
	-- 	cond = nocode,
	-- 	dependencies = {
	-- 		"mfussenegger/nvim-dap"
	-- 	},
	-- 	-- build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
	-- },
	{
		"folke/neodev.nvim",
		cond = nocode,
		config = function()
			require("plugins.neodev")
		end,
	},
	{ "sindrets/diffview.nvim",   dependencies = "nvim-lua/plenary.nvim", cond = nocode },
	{ "kassio/neoterm",           cond = nocode },
	{
		"nvim-lualine/lualine.nvim",
		cond = nocode,
		config = function()
			require("plugins.lualine")
		end,
	},
	{
		"kdheepak/tabline.nvim",
		cond = nocode,
		dependencies = {
			"nvim-lualine/lualine.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("plugins.tabline")
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		cond = nocode,
		config = function()
			require("plugins.symbols-outline")
		end,
	},
	{
		"folke/which-key.nvim",
		cond = nocode,
		event = "VeryLazy",
		config = function()
			require("plugins.which-key")
		end,
	},
	{ "lambdalisue/suda.vim" },
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
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
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
		cond = incode,
	},
	{
		"BetaGo/nvim-colorizer.lua",
		cond = nocode,
		config = function()
			require("plugins.nvim-colorizer")
		end,
	},
	{
		"windwp/nvim-autopairs",
		cond = nocode,
		event = "InsertEnter",
		config = function()
			require("plugins.autopairs")
		end,
	},
	{
		"onsails/lspkind.nvim",
		cond = nocode,
	},
	{
		"folke/flash.nvim",
		-- cond = nocode,
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		-- stylua: ignore
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{
				"S",
				mode = { "n", "o", "x" },
				function() require("flash").treesitter() end,
				desc =
				"Flash Treesitter"
			},
			{
				"R",
				mode = { "o", "x" },
				function() require("flash").treesitter_search() end,
				desc =
				"Treesitter Search"
			},
			{
				"<c-s>",
				mode = { "c" },
				function() require("flash").toggle() end,
				desc =
				"Toggle Flash Search"
			},
		},
	},
	{ 'ojroques/nvim-osc52' },
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		cond = nocode,
		config = function()
			require("plugins.chatgpt")
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim"
		}
	},
	{
		'f-person/git-blame.nvim',
		cond = nocode,
		init = function()
			vim.g.gitblame_enabled = 0
		end
	},
	{
		'glacambre/firenvim',

		-- Lazy load firenvim
		-- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
		lazy = not vim.g.started_by_firenvim,
		build = function()
			vim.fn["firenvim#install"](0)
		end
	}

}, {
	dev = {
		-- directory where you store your local plugin projects
		path = "~/workspace",
		---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
		patterns = {}, -- For example {"folke"}
		fallback = false, -- Fallback to git when local plugin doesn't exist
	},
})
