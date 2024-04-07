require("catppuccin").setup({
	-- flavour = "mocha", -- latte, frappe, macchiato, mocha
	color_overrides = {
		mocha = {
			pink = "#f5c2e7",
			mauve = "#D699B6",
			red = "#e67e80",
			maroon = "#eba0ac",
			teal = "#83C092",
			sapphire = "#74c7ec",
			blue = "#7fbbb3",
			lavender = "#b4befe",
			surface0 = "#232A2E",
			overlay2 = "#9399b2",
			overlay1 = "#7f849c",
			base = "#2D353B",
			mantle = "#343F44",
			crust = "#3D484D",
		},
	},
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	term_colors = true,
	-- transparent_background = true,
	integrations = {
		alpha = true,
		cmp = true,
		flash = true,
		ufo = true,
		treesitter = true,
		notify = true,
		noice = true,
		symbols_outline = true,
		which_key = true,
		mason = true,
		dap = true,
		dap_ui = true,
		telescope = {
			enabled = true,
		},
		nvimtree = true,
		lsp_trouble = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},
		navic = {
			enabled = true,
			custom_bg = "NONE", -- "lualine" will set background to mantle
		},
	},
})
