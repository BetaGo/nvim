vim.filetype.add({
	pattern = {
		[".*%.ipynb.*"] = "python",
		-- uses lua pattern matching
		-- rathen than naive matching
	},
})

vim.opt.spell = false
