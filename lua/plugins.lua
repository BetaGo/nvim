local nocode = require("utils").nocode
local no_code_and_neovide = require("utils").no_code_and_neovide

return {
	{ "kdheepak/lazygit.nvim", cond = nocode },
	{
		cond = nocode,
		"numToStr/Comment.nvim",
		config = function()
			require("configs.comment")
		end,
		lazy = false,
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring", cond = nocode },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		cond = nocode,
		config = function()
			require("configs.telescope")
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
			require("configs.catppuccin")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		cond = nocode,
		main = "ibl",
		config = function()
			require("configs.indent-blankline")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		-- cond = nocode,
		config = function()
			require("configs.nvim-treesitter")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		-- cond = nocode
	},
	{
		"windwp/nvim-ts-autotag",
		cond = nocode,
		config = function()
			require("configs.nvim-ts-autotag")
		end,
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
		"pmizio/typescript-tools.nvim",
		cond = nocode,
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		ft = { "rust" },
	},
	{
		"stevearc/conform.nvim", -- formatters
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		cond = nocode,
		config = function()
			require("configs.conform")
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
			require("configs.nvim-cmp")
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
			require("configs.luasnip")
		end,
	},
	{
		"mfussenegger/nvim-dap",
		cond = nocode,
		dependencies = {
			"theHamsta/nvim-dap-virtual-text",
			"nvim-telescope/telescope-dap.nvim",
			"mfussenegger/nvim-dap-python",
		},
		config = function()
			require("configs.nvim-dap")
		end,
	},
	{

		"rcarriga/nvim-dap-ui",
		cond = nocode,
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
	},
	{
		"folke/neodev.nvim",
		cond = nocode,
		config = function()
			require("configs.neodev")
		end,
	},
	{ "kassio/neoterm", cond = nocode },
	{
		"nvim-lualine/lualine.nvim",
		cond = nocode,
		config = function()
			require("configs.lualine")
		end,
	},
	-- {
	-- 	"kdheepak/tabline.nvim",
	-- 	cond = nocode,
	-- 	dependencies = {
	-- 		"nvim-lualine/lualine.nvim",
	-- 		"kyazdani42/nvim-web-devicons",
	-- 	},
	-- 	config = function()
	-- 		require("configs.tabline")
	-- 	end,
	-- },
	{
		"folke/which-key.nvim",
		cond = nocode,
		event = "VeryLazy",
		config = function()
			require("configs.which-key")
		end,
	},
	{ "lambdalisue/suda.vim" },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		cond = nocode,
		config = function()
			require("configs.noice")
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
			require("configs.nvim-surround")
		end,
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		cond = nocode,
		config = function()
			require("configs.alpha")
		end,
	},
	{ "jmcantrell/vim-diffchanges", cond = nocode },
	{ "sindrets/diffview.nvim" },
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		cond = nocode,
		config = function()
			require("configs.todo-comments")
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		cond = nocode,
		config = function()
			require("configs.trouble")
		end,
	},
	{
		"folke/twilight.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"BetaGo/nvim-colorizer.lua",
		cond = nocode,
		config = function()
			require("configs.nvim-colorizer")
		end,
	},
	{
		"windwp/nvim-autopairs",
		cond = nocode,
		event = "InsertEnter",
		config = function()
			require("configs.autopairs")
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
			require("configs.symbols-outline")
		end,
	},
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("configs.neogen")
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
				mode = { "n", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			-- {
			-- 	"R",
			-- 	mode = { "o", "x" },
			-- 	function()
			-- 		require("flash").treesitter_search()
			-- 	end,
			-- 	desc = "Treesitter Search",
			-- },
			-- {
			-- 	"<c-s>",
			-- 	mode = { "c" },
			-- 	function()
			-- 		require("flash").toggle()
			-- 	end,
			-- 	desc = "Toggle Flash Search",
			-- },
		},
	},
	{ "ojroques/nvim-osc52" },
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		cond = nocode,
		config = function()
			require("configs.chatgpt")
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
			require("configs.nvim-devdocs")
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
			dir = require("user-conf").obsidian_valut_path,
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
			require("configs.project")
		end,
	},
	{
		"mfussenegger/nvim-lint",
		cond = nocode,
		config = function()
			require("configs.nvim-lint")
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
			require("configs.nvim-ufo")
		end,
	},
	{
		"max397574/better-escape.nvim",
		cond = nocode,
		config = function()
			require("better_escape").setup({
				mapping = { "kk", "jj" },
			})
		end,
	},
	{ "olrtg/nvim-emmet", cond = nocode },
	{ "eandrju/cellular-automaton.nvim", cond = nocode },
	{
		"johmsalas/text-case.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("textcase").setup({})
			require("telescope").load_extension("textcase")
		end,
		keys = {
			"ga", -- Default invocation prefix
			{ "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "v" }, desc = "Telescope" },
		},
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"BetaGo/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
	},
	{
		"3rd/image.nvim",
		cond = no_code_and_neovide(),
		config = function()
			require("configs.image")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
		-- branch = "go-away-python",
		-- opts = {
		-- 	rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }, -- Specify LuaRocks packages to install
		-- },
		-- config = function()
		-- 	require("luarocks").setup({})
		-- end,
	},
	{
		"rest-nvim/rest.nvim",
		ft = "http",
		-- dependencies = { "luarocks.nvim" },
		config = function()
			require("rest-nvim").setup()
		end,
	},
	-- {
	-- 	"mvllow/modes.nvim",
	-- 	config = function()
	-- 		require("modes").setup({
	-- 			line_opacity = {
	-- 				visual = 0.1,
	-- 			},
	-- 			colors = {
	-- 				copy = "#f5c359",
	-- 				delete = "#c75c6a",
	-- 				insert = "#78ccc5",
	-- 				visual = "#9745be",
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	},
	{
		"nvim-zh/colorful-winsep.nvim",
		event = { "WinNew" },
		cond = nocode,
		config = function()
			require("configs.colorful-winsep")
		end,
	},

	{
		"luckasRanarison/tailwind-tools.nvim",
		cond = nocode,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {}, -- your configuration
	},

	-- {
	-- 	"m4xshen/hardtime.nvim",
	-- 	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	-- 	opts = {},
	-- },
}
