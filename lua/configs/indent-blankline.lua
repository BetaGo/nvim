--Map blankline
vim.o.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
local highlight = {
	"RainbowGreen",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowViolet",
	"RainbowCyan",
	"RainbowRed",
}

local hooks = require("ibl.hooks")

-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	-- vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#BF616A" })
	-- vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#EBCB8B" })
	-- vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#5E81AC" })
	-- vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D08770" })
	-- vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#A3BE8C" })
	-- vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#B48EAD" })
	-- vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#88C0D0" })
end)

hooks.register(hooks.type.ACTIVE, function(bufnr)
	local max_filesize = 500 * 1024 -- 500 KB
	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
	if ok and stats and stats.size > max_filesize then
		return false
	end
	return vim.api.nvim_buf_line_count(bufnr) < 5000
end)

require("ibl").setup({
	-- indent = { highlight = highlight },
	scope = { highlight = highlight },
	-- indent = { char = '▏' },
})
