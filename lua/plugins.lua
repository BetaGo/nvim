local nocode = require("utils").nocode
local no_code_and_neovide = require("utils").no_code_and_neovide

return {
	{

		"catppuccin/nvim",
		name = "catppuccin",
		-- dev = true,
		priority = 1000,
		config = function()
			require("configs.catppuccin")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("configs.nvim-treesitter")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	{ "lambdalisue/suda.vim" },
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("configs.nvim-surround")
		end,
	},
	{
		"folke/flash.nvim",
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
		},
	},
	{
		"johmsalas/text-case.nvim",
		config = function()
			require("textcase").setup({})
		end,
	},
	{ "LudoPinelli/comment-box.nvim" },
	{
		"monaqa/dial.nvim",
		config = function()
			require("configs.dial")
		end,
	},
	{
		"folke/which-key.nvim",
		-- cond = nocode,
		event = "VeryLazy",
		config = function()
			require("configs.which-key")
		end,
	},

	--          ╭─────────────────────────────────────────────────────────╮
	--          │        all of 👇 should not load when use vscode        │
	--          ╰─────────────────────────────────────────────────────────╯
	{ "kdheepak/lazygit.nvim", cond = nocode },
	{ "ojroques/nvim-osc52", cond = nocode },
	{ "b0o/schemastore.nvim", cond = nocode },
	{
		"aserowy/tmux.nvim",
		cond = nocode,
		config = function()
			return require("tmux").setup()
		end,
	},
	{
		"mistricky/codesnap.nvim",
		cond = nocode,
		build = "make",
		config = function()
			require("configs.codesnap")
		end,
	},
	{
		"AckslD/nvim-FeMaco.lua",
		cond = nocode,
		config = function()
			require("femaco").setup()
		end,
	},
	{
		"folke/zen-mode.nvim",
		cond = nocode,
		opts = {},
	},
	{
		"danymat/neogen",
		cond = nocode,
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("configs.neogen")
		end,
	},
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
		"lukas-reineke/indent-blankline.nvim",
		cond = nocode,
		main = "ibl",
		config = function()
			require("configs.indent-blankline")
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
		"goolord/alpha-nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		cond = nocode,
		config = function()
			require("configs.alpha")
		end,
	},
	{ "jmcantrell/vim-diffchanges", cond = nocode },
	{ "sindrets/diffview.nvim", cond = nocode },
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
		-- tag = "legacy",
		event = "LspAttach",
		opts = {
			-- options
		},
	},
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
		"stevearc/oil.nvim",
		cond = nocode,
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"BetaGo/markdown-preview.nvim",
		-- dev = true,
		cond = nocode,
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
	},
	-- {
	-- 	"3rd/image.nvim",
	-- 	cond = no_code_and_neovide(),
	-- 	config = function()
	-- 		require("configs.image")
	-- 	end,
	-- },
	{
		"nvim-neo-tree/neo-tree.nvim",
		cond = nocode,
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},
	{
		"vhyrro/luarocks.nvim",
		cond = nocode,
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
		cond = nocode,
		ft = "http",
		-- dependencies = { "luarocks.nvim" },
		config = function()
			require("rest-nvim").setup()
		end,
	},
	{
		"utilyre/barbecue.nvim",
		cond = nocode,
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
		"luckasRanarison/tailwind-tools.nvim",
		cond = nocode,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			document_color = {
				enabled = true,
				kind = "background",
			},
		},
	},
	{
		"smjonas/inc-rename.nvim",
		cond = nocode,
		config = function()
			require("inc_rename").setup()
		end,
	},
	{
		"tpope/vim-dadbod",
		cond = nocode,
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		cond = nocode,
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
}
