local lspkind = require("lspkind")
-- luasnip setup
local luasnip = require("luasnip")
-- nvim-cmp setup
local cmp = require("cmp")
local cmp_window = require("cmp.config.window")

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp_window.bordered(),
        documentation = cmp_window.bordered(),
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
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
    -- sources = cmp.config.sources({
    --     { name = "nvim_lsp" },
    --     {
    --         { name = "path" },
    --         { name = "luasnip" },
    --         { name = "buffer" },
    --         { name = "cmdline" },
    --         { name = "nvim_lsp_signature_help" },
    --     },
    -- }),
    sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "calc" },
        { name = "emoji" },
        { name = "treesitter" },
        { name = "nvim_lsp_signature_help" },
    },

    formatting = {
        format = function(entry, vim_item)
            if vim.tbl_contains({ "path" }, entry.source.name) then
                local icon, hl_group = require("nvim-web-devicons").get_icon(entry:get_completion_item().label)
                if icon then
                    vim_item.kind = icon .. " File"
                    vim_item.kind_hl_group = hl_group
                    vim_item.menu = ""
                    return vim_item
                end
            end
            return lspkind.cmp_format({
                before = function(entry_l, vim_item_l)
                    vim_item_l.menu = ({
                        nvim_lsp = "",
                        path = "",
                        luasnip = "",
                        buffer = "",
                        calc = "󰃬",
                        emoji = "󰞅",
                        treesitter = "",
                    })[entry_l.source.name]
                    return vim_item_l
                end,
            })(entry, vim_item)
        end,
        -- format = lspkind.cmp_format(),
    },
})
