-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"vim",
		"vimdoc",
		"python",
		"html",
		"css",
		"typescript",
		"tsx",
		"javascript",
		"json",
		"bash",
		"markdown",
		"markdown_inline",
		"toml",
		"yaml",
		"sql",
		"rust",
		"xml",
		"http",
		"graphql",
    "mermaid",
	},
	highlight = {
		enable = true,
		disable = function(lang, buf)
			if vim.g.vscode then
				return true
			end
			local max_filesize = 100 * 1024 -- 500 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},
	-- indent = {
	-- 	enable = true,
	-- },
	-- textobjects = {
	-- 	select = {
	-- 		enable = true,
	-- 		lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
	-- 		keymaps = {
	-- 			-- You can use the capture groups defined in textobjects.scm
	-- 			["af"] = "@function.outer",
	-- 			["if"] = "@function.inner",
	-- 			["ac"] = "@class.outer",
	-- 			["ic"] = "@class.inner",
	-- 		},
	-- 	},
	-- 	move = {
	-- 		enable = true,
	-- 		set_jumps = true, -- whether to set jumps in the jumplist
	-- 		goto_next_start = {
	-- 			["]m"] = "@function.outer",
	-- 			["]]"] = "@class.outer",
	-- 		},
	-- 		goto_next_end = {
	-- 			["]M"] = "@function.outer",
	-- 			["]["] = "@class.outer",
	-- 		},
	-- 		goto_previous_start = {
	-- 			["[m"] = "@function.outer",
	-- 			["[["] = "@class.outer",
	-- 		},
	-- 		goto_previous_end = {
	-- 			["[M"] = "@function.outer",
	-- 			["[]"] = "@class.outer",
	-- 		},
	-- 	},
	-- },
})

-- FIXME: performance issue when open large json file
-- vim.cmd([[
-- 	set foldmethod=expr
-- 	set foldexpr=nvim_treesitter#foldexpr()
-- 	set nofoldenable                     " Disable folding at startup.
-- ]])
