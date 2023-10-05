vim.cmd([[
autocmd BufNewFile,BufRead *.ttml set filetype=html
]])

vim.cmd([[
autocmd BufNewFile,BufRead *.lepus set filetype=javascript
]])


vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.textwidth = 79
        vim.opt_local.wrap = true
    end,
})
