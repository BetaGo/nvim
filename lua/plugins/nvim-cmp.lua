local palettes = require("everforest.colours")
local config = require("everforest").config
local mod_hl = require("utils").mod_hl

local palette = palettes.generate_palette(config, vim.o.background)

if config.transparent_background_level == 2 then
    palette.bg1 = palette.none
end

local lspkind = require("lspkind")
-- luasnip setup
local luasnip = require("luasnip")
-- nvim-cmp setup
local cmp = require("cmp")
-- local cmp_window = require("cmp.config.window")
local devicons = require("nvim-web-devicons")

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    -- window = {
    --     completion = cmp_window.bordered(),
    --     documentation = cmp_window.bordered(),
    -- },
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
        { name = "calc" },
        { name = "emoji" },
        { name = "treesitter" },
    },
    window = {
        completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
        },
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            if vim.tbl_contains({ "path" }, entry.source.name) then
                local icon, hl_group = devicons.get_icon(entry:get_completion_item().label)
                if icon then
                    vim_item.kind =" " .. icon .. " "
                    vim_item.kind_hl_group = "CmpItemKindFile"
                    vim_item.menu = "    (File)"
                    return vim_item
                end
            end
            local kind = require("lspkind").cmp_format({
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
        -- format = lspkind.cmp_format(),
    },
})

local custom_hl = {

    CmpItemMenu = { fg = palette.purple, bg = "NONE", italic = true },
    CmpItemAbbrDeprecated = { fg = palette.grey, bg = palette.none },
    CmpItemKind = { fg = palette.yellow, bg = palette.bg_yellow },
    CmpItemKindClass = { fg = palette.yellow, bg = palette.bg_yellow },
    CmpItemKindColor = { fg = palette.aqua, bg = palette.bg5 },
    CmpItemKindConstant = { fg = palette.blue, bg = palette.bg_blue },
    CmpItemKindConstructor = { fg = palette.green, bg = palette.bg_green },
    CmpItemKindEnum = { fg = palette.yellow, bg = palette.bg_yellow },
    CmpItemKindEnumMember = { fg = palette.purple, bg = palette.bg0 },
    CmpItemKindEvent = { fg = palette.orange, bg = palette.bg1 },
    CmpItemKindField = { fg = palette.green, bg = palette.bg_green },
    CmpItemKindFile = { fg = palette.aqua, bg = palette.bg5 },
    CmpItemKindFolder = { fg = palette.aqua, bg = palette.bg5 },
    CmpItemKindFunction = { fg = palette.green, bg = palette.bg_green },
    CmpItemKindInterface = { fg = palette.yellow, bg = palette.bg_yellow },
    CmpItemKindKeyword = { fg = palette.red, bg = palette.bg_red },
    CmpItemKindMethod = { fg = palette.green, bg = palette.bg_green },
    CmpItemKindModule = { fg = palette.yellow, bg = palette.bg_yellow },
    CmpItemKindOperator = { fg = palette.orange, bg = palette.bg1 },
    CmpItemKindProperty = { fg = palette.blue, bg = palette.bg_blue },
    CmpItemKindReference = { fg = palette.aqua, bg = palette.bg5 },
    CmpItemKindSnippet = { fg = palette.aqua, bg = palette.bg5 },
    CmpItemKindStruct = { fg = palette.yellow, bg = palette.bg_yellow },
    CmpItemKindText = { fg = palette.fg, bg = palette.bg0 },
    CmpItemKindTypeParameter = { fg = palette.yellow, bg = palette.bg_yellow },
    CmpItemKindUnit = { fg = palette.purple, bg = palette.bg0 },
    CmpItemKindValue = { fg = palette.purple, bg = palette.bg0 },
    CmpItemKindVariable = { fg = palette.blue, bg = palette.bg_blue },
}

for group, highlights in pairs(custom_hl) do
    mod_hl(group, highlights)
end
-- Customization for Pmenu
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
-- vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })

-- vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = palette.grey1, bg = "NONE", strikethrough = true })
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
-- vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

-- vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
-- vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
-- vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })

-- vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" })
-- vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" })
-- vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#C3E88D", bg = "#9FBD73" })

-- vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
-- vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
-- vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })

-- vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
-- vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
-- vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
-- vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
-- vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })

-- vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
-- vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })

-- vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
-- vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
-- vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })

-- vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
-- vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
-- vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })

-- vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
-- vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
-- vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })
