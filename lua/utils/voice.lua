local Utils = require("chatgpt.utils")
local M = {}


M.get_visual_selection = function()
    local s_start = vim.fn.getpos("'<")
    local s_end = vim.fn.getpos("'>")
    local n_lines = math.abs(s_end[2] - s_start[2]) + 1
    local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
    lines[1] = string.sub(lines[1], s_start[3], -1)
    if n_lines == 1 then
        lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
    else
        lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
    end
    return table.concat(lines, '\n')
end


M.say_visual_selection = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local lines, start_row, start_col, end_row, end_col = Utils.get_visual_lines(bufnr)

    local s = table.concat(lines, "\n")

    -- local s = M.get_visual_selection()
    local ok, is_exe = pcall(vim.fn.executable, 'say')
    if ok then
        -- vim.fn.execute(table.concat(obj, ' '))
        -- :echo system('ls '..shellescape(expand('%:h')))
        vim.fn.system('say ' .. vim.fn.shellescape(s) .. '&')
    end
end



return M
