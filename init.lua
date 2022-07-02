require("settings")
require("keymap")
require("packer-conf")
require("custom-theme")

require("plugins.bufferline")
require("plugins.indent-blankline")
require("plugins.neoformat")
require("plugins.nvim-tree")
require("plugins.nvim-treesitter")
require("plugins.symbols-outline")
require("plugins.telescope")
require("plugins.vim-fugitive")

require("lsp")

-- Highlight on yank
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])
