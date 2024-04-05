require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettier" } },
		javascriptreact = { { "prettier" } },
		html = { { "prettier" } },
		json = { { "prettier" } },
		css = { { "prettier" } },
		less = { { "prettier" } },
		scss = { { "prettier" } },
		sass = { { "prettier" } },
		jsonc = { { "prettier" } },
		markdown = { { "prettier" } },
		svelte = { { "prettier" } },
		typescript = { { "prettier" } },
		typescriptreact = { { "prettier" } },
		vue = { { "prettier" } },
	},
})

local function ends_with(str, ending)
	return ending == "" or string.sub(str, -string.len(ending)) == ending
end

require("conform").formatters.prettier = {
	prepend_args = function(self, ctx)
		if ends_with(ctx.filename, ".ttml") then
			return { "--parser", "html" }
		elseif ends_with(ctx.filename, ".lepus") then
			return { "--parser", "typescript" }
		end
		return {}
	end,
}
