--Set colorscheme (order is important here)
-- vim.o.background = "dark"
-- vim.o.background = "light"
-- vim.g.transparent_enabled = true;

-- vim.g.nord_disable_background = true;
-- vim.g.edge_transparent_background = 2
-- vim.g.edge_enable_italic = 1

-- vim.cmd([[colorscheme edge]])
--
require("everforest").setup({
    background = "medium",
    transparent_background_level = 2,
})
vim.cmd([[colorscheme everforest]])
