require("nvim-dap-virtual-text").setup {
    commented = true,
}
require("dap-python").setup()

-- require("dap-vscode-js").setup({
--     -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
--     debugger_path = os.getenv('HOME') .. "/.local/share/nvim/mason/packages/js-debug-adapter/", -- Path to vscode-js-debug installation.
--     debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
--     adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },               -- which adapters to register in nvim-dap
--     -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
--     -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
--     -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
-- })

require("dap").adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
        command = "node",
        -- 💀 Make sure to update this path to point to your installation
        -- args = {"/path/to/js-debug/src/dapDebugServer.js", "${port}"},
        -- args = { os.getenv('HOME') .. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug-adapter", "${port}" },
        args = { os.getenv('HOME') .. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}" },
    }
}

for _, language in ipairs({ "typescript", "javascript" }) do
    require("dap").configurations[language] = {
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
        },
        {
            -- use nvim-dap-vscode-js's pwa-node debug adapter
            type = "pwa-node",
            -- launch a new process to attach the debugger to
            request = "launch",
            -- name of the debug action you have to select for this config
            name = "Launch current file in new node process (" .. language .. ")",
            program = "${file}",
            cwd = "${workspaceFolder}",
        },
    }
end




local dap, dapui = require "dap", require "dapui"

dapui.setup {} -- use default

-- local dap_breakpoint = {
--     error = {
--         text = "🟥",
--         texthl = "LspDiagnosticsSignError",
--         linehl = "",
--         numhl = "",
--     },
--     rejected = {
--         text = "",
--         texthl = "LspDiagnosticsSignHint",
--         linehl = "",
--         numhl = "",
--     },
--     stopped = {
--         text = "⭐️",
--         texthl = "LspDiagnosticsSignInformation",
--         linehl = "DiagnosticUnderlineInfo",
--         numhl = "LspDiagnosticsSignInformation",
--     },
-- }

-- vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
-- vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
-- vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
--
-- for javascript
