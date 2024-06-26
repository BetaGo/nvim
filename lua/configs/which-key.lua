local wk = require("which-key")
wk.setup({
	window = {
		-- border = "single",  -- none, single, double, shadow
		border = "none", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		-- margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
		-- padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
		zindex = 1000, -- positive value to position WhichKey above other floating windows.
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	-- triggers_blacklist = {
	-- 	n = { "d", "y" },
	-- },
})

-- vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "NONE", fg = "NONE" })
-- vim.api.nvim_set_hl(0, "WhichKeyBorder", { bg = "NONE" })
