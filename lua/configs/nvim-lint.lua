require("lint").linters_by_ft = {
	markdown = { "codespell", "vale" },
	python = { "codespell" },
	javascript = { "codespell" },
	javascriptreact = { "codespell" },
	typescript = { "codespell" },
	typescriptreact = { "codespell" },
	html = { "codespell" },
	svelte = { "codespell" },
	bash = { "codespell" },
	lua = { "codespell" },
	yaml = { "codespell" },
	toml = { "codespell" },
	json = { "codespell" },
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
