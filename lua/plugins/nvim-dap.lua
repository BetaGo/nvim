require("nvim-dap-virtual-text").setup({
	commented = true,
})
require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")

local dap, dapui = require("dap"), require("dapui")

dapui.setup({}) -- use default

local js_based_languages = { "typescript", "javascript", "typescriptreact" }

dap.adapters["pwa-node"] = {
	type = "server",
	-- host = "127.0.0.1",
	host = "localhost",
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

dap.adapters["pwa-chrome"] = {
	type = "server",
	-- host = "127.0.0.1",
	host = "localhost",
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

for _, language in ipairs(js_based_languages) do
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
		{

			name = "Attach chrome",
			type = "pwa-chrome",
			request = "attach",
			cwd = "${workspaceFolder}",
			protocol = "inspector",
			port = 9222,
			webRoot = "${workspaceFolder}",
		},
		{

			name = "Launch chrome",
			type = "pwa-chrome",
			request = "launch",
			webRoot = "${workspaceFolder}",
			url = function()
				return "http://localhost" .. vim.fn.input("{:Port?}/{path}: ")
			end,
		},

		-- {
		-- 	type = "pwa-node",
		-- 	request = "launch",
		-- 	name = "[ts-node]Launch Current File (Typescript)",
		-- 	cwd = "${workspaceFolder}",
		-- 	-- runtimeArgs = { "--loader=ts-node/esm" },
		-- 	runtimeArgs = { "--nolazy", "-r", "ts-node/register" },
		-- 	program = "${file}",
		-- 	runtimeExecutable = "node",
		-- 	-- args = { '${file}' },
		-- 	sourceMaps = true,
		-- 	protocol = "inspector",
		-- 	outFiles = { "${workspaceFolder}/**/**/*", "!**/node_modules/**" },
		-- 	skipFiles = { "<node_internals>/**", "node_modules/**" },
		-- 	resolveSourceMapLocations = {
		-- 		"${workspaceFolder}/**",
		-- 		"!**/node_modules/**",
		-- 	},
		-- },
		-- {
		-- 	type = "pwa-node",
		-- 	request = "launch",
		-- 	name = "[tsx]Launch Current File (Typescript)",
		-- 	cwd = "${workspaceFolder}",
		-- 	runtimeArgs = { "--import", "tsx" },
		-- 	program = "${file}",
		-- 	runtimeExecutable = "node",
		-- 	sourceMaps = true,
		-- 	protocol = "inspector",
		-- 	outFiles = { "${workspaceFolder}/**/**/*", "!**/node_modules/**" },
		-- 	skipFiles = { "<node_internals>/**", "node_modules/**" },
		-- 	resolveSourceMapLocations = {
		-- 		"${workspaceFolder}/**",
		-- 		"!**/node_modules/**",
		-- 	},
		-- },
	}
end

require("dap.ext.vscode").load_launchjs(nil, {
	["pwa-node"] = js_based_languages,
	-- ["node"] = js_based_languages,
	-- ["chrome"] = js_based_languages,
	-- ["pwa-chrome"] = js_based_languages,
})

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
