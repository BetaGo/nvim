vim.cmd([[
    let g:neoformat_enabled_python = ['black']
    let g:neoformat_enabled_css = ['prettier']
    let g:neoformat_enabled_less = ['prettier']
    let g:neoformat_enabled_html = ['prettier']
    let g:neoformat_enabled_javascript = ['prettier']
    let g:neoformat_enabled_json = ['prettier']
    let g:neoformat_enabled_jsonc = ['prettier']
    let g:neoformat_enabled_markdown = ['prettier']
    let g:neoformat_enabled_svelte = ['prettier']
    let g:neoformat_enabled_typescript = ['prettier']
    let g:neoformat_enabled_typescriptreact = ['prettier']
    let g:neoformat_enabled_vue = ['prettier']
    let g:neoformat_try_node_exe = 1
    let g:neoformat_only_msg_on_error = 1
    let g:neoformat_run_all_formatters = 1
]])

local M = {}
-- local ext_to_lang = {
--     py = "python",
--     lua = "lua",
--     ts = "typescript",
--     tsx = "typescriptreact",
--     js = "javascript",
--     jsx = "javascriptreact",
--     css = "css",
--     less = "less",
--     html = "html",
--     json = "json",
--     jsonc = "jsonc",
--     md = "markdown",
--     svelte = "svelte",
--     vue = "vue",
-- }

M.format = function()
    -- local buf = vim.api.nvim_get_current_buf()
    -- local name = vim.api.nvim_buf_get_name(buf)
    -- local ext = name:match("%.(%w+)$")
    -- local lang = ext_to_lang[ext]
    local lang = vim.bo.filetype
    if lang then
        local key = "neoformat_enabled_" .. lang
        if vim.g[key] then
            vim.cmd("Neoformat")
            -- return
        end
    end
    vim.lsp.buf.format()
end

return M
