require('nvim-devdocs').setup({
    previewer_cmd = "glow",
    cmd_args = { "-s", "dark", "-w", "80" },
    wrap = true,
    picker_cmd = true,
    picker_cmd_args = { "-s", "dark", "-w", "50" },
    after_open = function(bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Esc>', ':close<CR>', {})
    end
})
