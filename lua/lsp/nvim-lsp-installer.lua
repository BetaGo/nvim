local wk = require("which-key")
-- Enable the following language servers
-- true means use common lsp config
local lsp_servers = {
	lua_ls = true,
	-- "rust_analyzer",
	taplo = true, -- toml
	-- "pylsp",
	pyright = true,
	ruff_lsp = true, -- python
	yamlls = true,
	bashls = true,
	tailwindcss = true,
	eslint = true,
	html = true,
	cssls = true,
	svelte = true,
	jsonls = true,
	emmet_language_server = true,
	clangd = true,
	sqls = true,

	-- special lsp config
	rust_analyzer = false,
	tsserver = false,
}

local ensure_installed_others = {
	-- linters
	"codespell",

	-- formatters
	"prettier",
	"stylua",
	"clang-format",

	-- daps
	"debugpy",
	"js-debug-adapter",
	"cpptools",
}

vim.api.nvim_create_user_command("MasonInstallAll", function()
	vim.cmd("MasonInstall " .. table.concat(ensure_installed_others, " "))
end, {})

local function get_keys(t)
	local keys = {}
	for key, _ in pairs(t) do
		table.insert(keys, key)
	end
	return keys
end

local ensure_installed = get_keys(lsp_servers)

-- LSP installer
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = ensure_installed,
})

-- LSP settings
local on_attach = function(_, bufnr)
	if vim.lsp.inlay_hint then
		vim.lsp.inlay_hint.enable(bufnr, true)
	end
	wk.register({
		l = {
			name = "Language Actions",
			a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "LSP code action" },
			d = {
				"<cmd>Telescope lsp_definitions<cr>",
				"Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope",
			},
			e = {
				"<cmd>lua require('trouble').toggle('workspace_diagnostics')<cr>",
				"workspace diagnostics from the builtin LSP client",
			},

			l = { "<cmd>SymbolsOutline<cr>", "Toggle symbols outline" },
			i = { "<cmd>Telescope lsp_incoming_calls<cr>", "Lists LSP incoming calls for word under the cursor" },
			o = { "<cmd>Telescope lsp_outgoing_calls<cr>", "Lists LSP outgoing calls for word under the cursor" },
			q = {
				"<cmd>lua require('trouble').toggle('document_diagnostics')<cr>",
				"document diagnostics from the builtin LSP client",
			},
			r = { "<cmd>Telescope lsp_references<cr>", "Lists LSP references for word under the cursor" },
		},
		["rn"] = {
			":IncRename<space>",
			"LSP Rename",
		},
	}, {
		buffer = bufnr,
		prefix = "<leader>",
	})

	wk.register({
		["gD"] = {
			"<cmd>lua vim.lsp.buf.declaration()<CR>",
			"Get declaration",
		},
		["gd"] = {
			"<cmd>lua require('telescope.builtin').lsp_definitions()<CR>",
			"Get definitions",
		},
		["K"] = {
			"<cmd>lua vim.lsp.buf.hover()<CR>",
			"LSP Hover",
		},
		["<C-k>"] = {
			"<cmd>lua vim.lsp.buf.signature_help()<CR>",
			"LSP Signature Help",
		},
	}, {
		buffer = bufnr,
	})
end

-- nvim-cmp supports additional completion capabilities
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
local enhance_server_opts = {
	["lua_ls"] = require("lsp.languages.lua-ls").lsp_opts,
	["ruff_lsp"] = require("lsp.languages.ruff-lsp").lsp_opts,
}

-- local language_servers = require("lspconfig").util.available_servers()
for lsp, use_common_conf in pairs(lsp_servers) do
	-- tsserver use typescript-tools
	if use_common_conf then
		local opts = {
			on_attach = on_attach,
			capabilities = capabilities,
		}
		if enhance_server_opts[lsp] then
			enhance_server_opts[lsp](opts)
		end

		require("lspconfig")[lsp].setup(opts)
	end
end

-- for typescript
require("typescript-tools").setup({
	on_attach = on_attach,
	settings = {
		tsserver_file_preferences = {
			-- Inlay Hints
			includeInlayParameterNameHints = "all",
			includeInlayParameterNameHintsWhenArgumentMatchesName = true,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayVariableTypeHints = true,
			includeInlayVariableTypeHintsWhenTypeMatchesName = true,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
			includeInlayEnumMemberValueHints = true,
		},
	},
})

-- for rust
vim.g.rustaceanvim = {
	-- Plugin configuration
	-- tools = {},
	-- LSP configuration
	server = {
		on_attach = on_attach,
		-- settings = {
		-- 	-- rust-analyzer language server configuration
		-- 	["rust-analyzer"] = {},
		-- },
	},
	-- DAP configuration
	-- dap = {},
}
