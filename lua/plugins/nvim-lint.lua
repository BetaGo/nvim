require("lint").linters_by_ft = {
	markdown = { "codespell" },
	python = { "pylint", "codespell" },
	javascript = { "codespell" },
	typescript = { "codespell" },
	typescriptreact = { "codespell" },
	html = { "codespell" },
	lua = { "codespell" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

-- vim.api.nvim_create_autocmd({ "InsertLeave" }, {
-- 	callback = function()
-- 		require("lint").try_lint()
-- 	end,
-- })
