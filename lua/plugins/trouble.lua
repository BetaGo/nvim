require("trouble").setup({
	-- use_diagnostic_signs = true,
})

local signs = {
	Error = "",
	Warning = "",
	Warn = "",
	Hint = "",
	Information = "",
	Info = "",
	Other = "",
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
