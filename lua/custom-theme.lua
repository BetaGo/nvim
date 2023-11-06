local config = require("everforest").config
local palettes = require("everforest.colours")
-- local mod_hl = require("utils").mod_hl
local palette = palettes.generate_palette(config, vim.o.background)

if config.transparent_background_level == 2 then
	palette.bg1 = palette.none
end

require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	integrations = {
		cmp = true,
		treesitter = true,
		notify = true,
		noice = true,
		symbols_outline = true,
		which_key = true,
		mason = true,
		dap = {
			enabled = true,
			enable_ui = true, -- enable nvim-dap-ui
		},
	},
})

vim.cmd.colorscheme("catppuccin")

--
-- require("everforest").setup({
--     background = "hard",
--     transparent_background_level = 0,
-- })

-- vim.cmd([[colorscheme everforest]])

-- overwrite colorschema
-- local custom_hl = {
-- 	CmpItemMenu = { fg = palette.purple, bg = "NONE", italic = true },
-- 	CmpItemAbbrDeprecated = { fg = palette.grey, bg = palette.none },
-- 	CmpItemKind = { fg = palette.yellow, bg = palette.bg_yellow },
-- 	CmpItemKindClass = { fg = palette.yellow, bg = palette.bg_yellow },
-- 	CmpItemKindColor = { fg = palette.aqua, bg = palette.bg5 },
-- 	CmpItemKindConstant = { fg = palette.blue, bg = palette.bg_blue },
-- 	CmpItemKindConstructor = { fg = palette.green, bg = palette.bg_green },
-- 	CmpItemKindEnum = { fg = palette.yellow, bg = palette.bg_yellow },
-- 	CmpItemKindEnumMember = { fg = palette.purple, bg = palette.bg0 },
-- 	CmpItemKindEvent = { fg = palette.orange, bg = palette.bg1 },
-- 	CmpItemKindField = { fg = palette.green, bg = palette.bg_green },
-- 	CmpItemKindFile = { fg = palette.aqua, bg = palette.bg5 },
-- 	CmpItemKindFolder = { fg = palette.aqua, bg = palette.bg5 },
-- 	CmpItemKindFunction = { fg = palette.green, bg = palette.bg_green },
-- 	CmpItemKindInterface = { fg = palette.yellow, bg = palette.bg_yellow },
-- 	CmpItemKindKeyword = { fg = palette.red, bg = palette.bg_red },
-- 	CmpItemKindMethod = { fg = palette.green, bg = palette.bg_green },
-- 	CmpItemKindModule = { fg = palette.yellow, bg = palette.bg_yellow },
-- 	CmpItemKindOperator = { fg = palette.orange, bg = palette.bg1 },
-- 	CmpItemKindProperty = { fg = palette.blue, bg = palette.bg_blue },
-- 	CmpItemKindReference = { fg = palette.aqua, bg = palette.bg5 },
-- 	CmpItemKindSnippet = { fg = palette.aqua, bg = palette.bg5 },
-- 	CmpItemKindStruct = { fg = palette.yellow, bg = palette.bg_yellow },
-- 	CmpItemKindText = { fg = palette.fg, bg = palette.bg0 },
-- 	CmpItemKindTypeParameter = { fg = palette.yellow, bg = palette.bg_yellow },
-- 	CmpItemKindUnit = { fg = palette.purple, bg = palette.bg0 },
-- 	CmpItemKindValue = { fg = palette.purple, bg = palette.bg0 },
-- 	CmpItemKindVariable = { fg = palette.blue, bg = palette.bg_blue },
-- 	PmenuSel = { bg = "NONE", fg = "NONE" },
-- 	Pmenu = { bg = "NONE", fg = "NONE" },
-- }

-- for group, highlights in pairs(custom_hl) do
--     mod_hl(group, highlights)
-- end
