require("lint").linters_by_ft = {
	markdown = { "cspell" },
	python = { "pylint", "cspell" },
	javascript = { "cspell" },
	typescript = { "cspell" },
	typescriptreact = { "cspell" },
	html = { "cspell" },
	lua = { "cspell" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

-- vim.api.nvim_create_autocmd({ "InsertLeave" }, {
-- 	callback = function()
-- 		require("lint").try_lint()
-- 	end,
-- })
