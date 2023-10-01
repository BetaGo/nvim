-- local plugin_path = vim.fn.expand("$VIMRUNTIME")
local plugin_path = vim.api.nvim_get_runtime_file("", true)[1]

require("chatgpt").setup({
    actions_paths = { plugin_path .. "/chatgpt-actions.json" }
})
