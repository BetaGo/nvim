local settings = {
	-- -- backup = false,                          -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	-- cmdheight = 2,                           -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	-- conceallevel = 0,                        -- so that `` is visible in markdown files
	-- -- colorcolumn = "90",
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
	-- termguicolors = true,                    -- set term gui colors (most terminals support this)
	timeoutlen = 400, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- Save undo history
	updatetime = 300, -- faster completion (4000ms default)
	-- writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	-- expandtab = true,                        -- convert tabs to spaces
	-- shiftwidth = 2,                          -- the number of spaces inserted for each indentation
	-- tabstop = 2,                             -- insert 2 spaces for a tab
	cursorline = true, -- highlight the current line
	cursorcolumn = true, -- highlight the current column
	-- number = true,                           -- set numbered lines
	-- relativenumber = false,                  -- set relative numbered lines
	-- numberwidth = 4,                         -- set number column width to 2 {default 4}
	-- signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
	-- wrap = false,                            -- display lines as one long line
    foldcolumn = '2',
}

vim.o.completeopt = "menuone,noselect"

--Make line numbers default
vim.wo.number = true

--Enable break indent
vim.o.breakindent = true

--Decrease update time
vim.wo.signcolumn = "yes"

-- tab_size
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

for key, value in pairs(settings) do
	vim.opt[key] = value
end
