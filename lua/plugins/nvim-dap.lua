require("nvim-dap-virtual-text").setup({
	commented = true,
})
require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")

local dap, dapui = require("dap"), require("dapui")

dapui.setup({}) -- use default

dap.adapters["pwa-node"] = {
	type = "server",
	host = "127.0.0.1",
	port = "${port}",
	executable = {
		command = "node",
		-- 💀 Make sure to update this path to point to your installation
		args = {
			vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
			"${port}",
		},
	},
}

for _, language in ipairs({ "typescript", "javascript" }) do
	dap.configurations[language] = {
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

dap.defaults.fallback.exception_breakpoints = { "uncaughted", "uncaught" }

local dap_breakpoint = {
	error = {
		text = "",
		texthl = "DapBreakpoint",
		linehl = "",
		numhl = "",
	},
	rejected = {
		text = "",
		texthl = "DapBreakpointRejected",
		linehl = "",
		numhl = "",
	},
	stopped = {
		text = "",
		texthl = "DapStopped",
		linehl = "",
		numhl = "",
	},
	condition = {
		text = "",
		texthl = "DapBreakpointCondition",
		linehl = "",
		numhl = "",
	},
	log = {
		text = "",
		texthl = "DapLogPoint",
		linehl = "",
		numhl = "",
	},
}

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
vim.fn.sign_define("DapBreakpointCondition", dap_breakpoint.condition)
vim.fn.sign_define("DapLogPoint", dap_breakpoint.condition)

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
