-- Enable the following language servers
local servers = {
	"lua_ls",
	-- "rust_analyzer",
	"taplo", -- toml
	-- "pylsp",
	"pyright",
	"ruff_lsp", -- python
	"tsserver",
	"yamlls",
	"bashls",
	"tailwindcss",
	"eslint",
	"html",
	"cssls",
	"svelte",
	"jsonls",
}

local ensure_installed_others = {
	-- linters
	"codespell",

	-- formatters
	"prettier",
	"stylua",

	-- daps
	"debugpy",
	"js-debug-adapter",
}

vim.api.nvim_create_user_command("MasonInstallAll", function()
	vim.cmd("MasonInstall " .. table.concat(ensure_installed_others, " "))
end, {})

-- LSP installer
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = servers,
})

-- LSP settings
local on_attach = function(_, bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities()

local enhance_server_opts = {
	["lua_ls"] = require("lsp.languages.lua-ls").lsp_opts,
	["ruff_lsp"] = require("lsp.languages.ruff-lsp").lsp_opts,
}

for _, lsp in pairs(servers) do
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	if enhance_server_opts[lsp] then
		enhance_server_opts[lsp](opts)
	end

	require("lspconfig")[lsp].setup(opts)
end
