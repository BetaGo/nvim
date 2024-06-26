-- luasnip setup
local luasnip = require("luasnip")
-- nvim-cmp setup
local cmp = require("cmp")
local cmp_window = require("cmp.config.window")
local devicons = require("nvim-web-devicons")
local lspkind = require("lspkind")
local border_style = require("user-conf").nui_border_style

lspkind.init({
	-- DEPRECATED (use mode instead): enables text annotations
	--
	-- default: true
	-- with_text = true,

	-- defines how annotations are shown
	-- default: symbol
	-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
	mode = "symbol_text",

	-- default symbol map
	-- can be either 'default' (requires nerd-fonts font) or
	-- 'codicons' for codicon preset (requires vscode-codicons font)
	--
	-- default: 'default'
	preset = "default",

	-- override preset symbols
	--
	-- default: {}
	symbol_map = {
		Text = "󰉿",
		Method = "󰆧",
		Function = "󰊕",
		Constructor = "",
		Field = "󰜢",
		Variable = "󰀫",
		Class = "󰠱",
		Interface = "",
		Module = "",
		Property = "󰜢",
		Unit = "󰑭",
		Value = "󰎠",
		Enum = "",
		Keyword = "󰌋",
		Snippet = "",
		Color = "󰏘",
		File = "󰈙",
		Reference = "󰈇",
		Folder = "󰉋",
		EnumMember = "",
		Constant = "󰏿",
		Struct = "󰙅",
		Event = "",
		Operator = "󰆕",
		TypeParameter = "󰰦",
	},
})

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			-- behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = {
		{
			name = "nvim_lsp",
			entry_filter = function(entry)
				return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
			end,
		},
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{
			name = "spell",
			option = {
				keep_all_entries = false,
				enable_in_context = function()
					return true
				end,
			},
		},
		{ name = "calc" },
		{ name = "emoji" },
		{ name = "treesitter" },
	},
	window = {
		completion = {
			border = border_style,
			col_offset = -3,
			side_padding = 0,
			winhighlight = "Normal:CmpNormal",
		},
		documentation = cmp_window.bordered({
			border = border_style,
		}),
	},
	formatting = {
		expandable_indicator = true,
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			if vim.tbl_contains({ "path" }, entry.source.name) then
				local icon, hl_group = devicons.get_icon(entry:get_completion_item().label)
				if icon then
					vim_item.kind = " " .. icon .. " "
					vim_item.kind_hl_group = "CmpItemKindFile"
					vim_item.menu = "    (File)"
					return vim_item
				end
			end
			local kind = lspkind.cmp_format({
				mode = "symbol_text",
				maxwidth = 50,
				before = function(entry_l, vim_item_l)
					local k = ({
						path = {
							hl_group = "CmpItemKindFile",
							kind = " Path",
						},
						luasnip = {
							hl_group = "CmpItemKindSnippet",
							kind = " LuaSnip",
						},
						buffer = {
							hl_group = "CmpItemKindText",
							kind = " Buffer",
						},
						calc = {
							hl_group = "CmpItemKindText",
							kind = "󰃬 Calc",
						},
						emoji = {
							hl_group = "CmpItemKindText",
							kind = "󰞅 Emoji",
						},
						treesitter = {
							hl_group = "CmpItemKindUnit",
							kind = " Treesitter",
						},
						["vim-dadbod-completion"] = {

							hl_group = "CmpItemKindText",
							kind = " DB",
						},
						spell = {
							hl_group = "CmpItemKindText",
							kind = "󰓆 Spell",
						},
					})[entry_l.source.name]
					if k then
						vim_item_l.kind = k.kind
						vim_item_l.kind_hl_group = k.hl_group
					end
					return vim_item_l
				end,
			})(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. (strings[1] or "") .. " "
			kind.menu = "    (" .. (strings[2] or "") .. ")"
			return kind
		end,
	},
})

cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
	sources = cmp.config.sources({
		{ name = "vim-dadbod-completion" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	}, {
		{ name = "buffer" },
	}),
})
