local settings = {
	breakindent = true,
	-- -- backup = false,                          -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	-- cmdheight = 2,                           -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	colorcolumn = "80",
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = false, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	-- pumheight = 10,                          -- pop up menu height
	-- showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
	-- showtabline = 2,                         -- always show tabs
	smartcase = true, -- smart case
	-- smartindent = true,                      -- make indenting smarter again
	-- splitbelow = true,                       -- force all horizontal splits to go below current window
	-- splitright = true,                       -- force all vertical splits to go to the right of current window
	-- swapfile = false,                        -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 400, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- Save undo history
	updatetime = 300, -- faster completion (4000ms default)
	-- writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	cursorline = true, -- highlight the current line
	cursorcolumn = false, -- highlight the current column
	number = true, -- set numbered lines
	-- relativenumber = false,                  -- set relative numbered lines
	-- numberwidth = 4,                         -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	-- wrap = false, -- display lines as one long line

	-- spell = true, -- enable spellsuggest
	spelllang = { "en_us", "cjk" },

	foldcolumn = "1",
	foldlevelstart = 99,
	foldlevel = 99,
	foldenable = true,
}

for key, value in pairs(settings) do
	vim.opt[key] = value
end

-- " Trigger a highlight in the appropriate direction when pressing these keys=
vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if os.getenv("SSH_FROM_KITTY") then
	local function copy(lines, _)
		require("osc52").copy(table.concat(lines, "\n"))
	end

	local function paste()
		return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
	end

	vim.g.clipboard = {
		name = "osc52",
		copy = { ["+"] = copy, ["*"] = copy },
		paste = { ["+"] = paste, ["*"] = paste },
	}
end

vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
vim.g.lazygit_floating_window_border_chars = {'┌','─', '┐', '│', '┘','─', '└', '│'} -- customize lazygit popup window border characters
vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed

vim.g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
vim.g.lazygit_config_file_path = '' -- custom config file path
-- OR
vim.g.lazygit_config_file_path = {} -- table of custom config file paths
