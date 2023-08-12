local M = {}

M.mod_hl = function(hl_name, opts)
    local is_ok, hl_def = pcall(vim.api.nvim_get_hl_by_name, hl_name, true)
    if is_ok then
        for k, v in pairs(opts) do
            hl_def[k] = v
        end
        vim.api.nvim_set_hl(0, hl_name, hl_def)
    end
end

return M
