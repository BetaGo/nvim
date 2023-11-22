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
	{ "kdheepak/lazygit.nvim", cond = nocode },
	{
		cond = nocode,
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.comment")
		end,
		lazy = false,
	},
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
		"nvim-telescope/telescope-fzf-native.nvim",
		cond = nocode,
		build = "make",
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		cond = nocode,
	},
	{ "nvim-telescope/telescope-ui-select.nvim", cond = nocode },
	{ "princejoogie/dir-telescope.nvim", cond = nocode },
	{
		-- "projekt0n/github-nvim-theme"
		-- "BetaGo/everforest-nvim",
		"catppuccin/nvim",
		name = "catppuccin",
		-- dev = true,
		cond = nocode,
		priority = 1000,
		config = function()
			require("custom-theme")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		cond = nocode,
		main = "ibl",
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
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		-- cond = nocode
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
		cond = nocode,
	},
	{ "williamboman/mason-lspconfig.nvim", cond = nocode },
	{
		"neovim/nvim-lspconfig",
		cond = nocode,
	},
	{
		"stevearc/conform.nvim", -- formatters
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		config = function()
			require("plugins.conform")
		end,
	},
	{ "hrsh7th/cmp-nvim-lsp", cond = nocode },
	{ "hrsh7th/cmp-buffer", cond = nocode },
	{ "hrsh7th/cmp-path", cond = nocode },
	{ "hrsh7th/cmp-calc", cond = nocode },
	{ "hrsh7th/cmp-emoji", cond = nocode },
	{ "ray-x/cmp-treesitter", cond = nocode },
	{ "f3fora/cmp-spell", cond = nocode },
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
		},
		config = function()
			require("plugins.nvim-dap")
		end,
	},
	{
		"folke/neodev.nvim",
		cond = nocode,
		config = function()
			require("plugins.neodev")
		end,
	},
	{ "kassio/neoterm", cond = nocode },
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
		"j-hui/fidget.nvim",
		cond = nocode,
		tag = "legacy",
		event = "LspAttach",
		opts = {
			-- options
		},
	},
	{
		"simrat39/symbols-outline.nvim",
		cond = nocode,
		config = function()
			require("plugins.symbols-outline")
		end,
	},
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.neogen")
		end,
	},
	{
		"folke/flash.nvim",
		-- cond = nocode,
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
	{ "ojroques/nvim-osc52" },
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
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"f-person/git-blame.nvim",
		cond = nocode,
		opts = {
			enabled = false,
		},
	},
	{
		"luckasRanarison/nvim-devdocs",
		cond = nocode,
		event = "VeryLazy",
		config = function()
			require("plugins.nvim-devdocs")
		end,
	},
	{
		"epwalsh/obsidian.nvim",
		lazy = true,
		cond = nocode,
		event = {
			"BufReadPre " .. require("user-conf").obsidian_valut_path .. "/**.md",
			"BufNewFile " .. require("user-conf").obsidian_valut_path .. "/**.md",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			dir = require("user-conf").ojroques,
		},
	},
	{
		"goerz/jupytext.vim",
		-- lazy = true,
		cond = nocode,
	},
	{
		"jghauser/follow-md-links.nvim",
		cond = nocode,
	},
	{ "RRethy/vim-illuminate", cond = nocode }, -- automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
	{
		"ahmedkhalf/project.nvim",
		cond = nocode,
		config = function()
			require("plugins.project")
		end,
	},
	{
		"mfussenegger/nvim-lint",
		cond = nocode,
		config = function()
			require("plugins.nvim-lint")
		end,
	},
	{ "nvim-pack/nvim-spectre", cond = nocode }, -- search & replace text
	{ "kevinhwang91/nvim-bqf", ft = "qf", cond = nocode },
	{
		"mikesmithgh/kitty-scrollback.nvim",
		cond = nocode,
		enabled = true,
		lazy = true,
		cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
		event = { "User KittyScrollbackLaunch" },
		version = "*", -- latest stable version, may have breaking changes if major version changed
		-- version = '^2.0.0', -- pin major version, include fixes and features that do not have breaking changes
		config = function()
			require("kitty-scrollback").setup()
		end,
	},
	{
		"stevearc/dressing.nvim",
		cond = nocode,
		opts = {},
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		cond = nocode,
		config = function()
			require("plugins.nvim-ufo")
		end,
	},
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup({
				mapping = { "kk", "jj" },
			})
		end,
	},
}, {
	dev = {
		-- directory where you store your local plugin projects
		path = require("user-conf").workspace_path,
		---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
		patterns = {}, -- For example {"folke"}
		fallback = false, -- Fallback to git when local plugin doesn't exist
	},
})
