local Utils = require("chatgpt.utils")

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

M.get_selected_text = function()
	local bufnr = vim.api.nvim_get_current_buf()
	local lines, start_row, start_col, end_row, end_col = Utils.get_visual_lines(bufnr)
	local s = table.concat(lines, "\n")
	return s
end

M.say_visual_selection = function()
	local s = M.get_selected_text()
	local ok, is_exe = pcall(vim.fn.executable, "say")
	if ok then
		-- vim.fn.execute(table.concat(obj, ' '))
		-- :echo system('ls '..shellescape(expand('%:h')))
		vim.fn.system("say " .. vim.fn.shellescape(s) .. "&")
	end
end

M.resolve_absolute_path = function(document_file_path, image_path)
	if string.sub(image_path, 1, 1) == "/" then
		return image_path
	end
	if string.sub(image_path, 1, 1) == "~" then
		return vim.fn.fnamemodify(image_path, ":p")
	end
	local document_dir = vim.fn.fnamemodify(document_file_path, ":h")
	local absolute_image_path = document_dir .. "/" .. image_path
	absolute_image_path = vim.fn.fnamemodify(absolute_image_path, ":p")
	return absolute_image_path
end

M.remove_query_string = function(url)
	local questionMarkPos = string.find(url, "?")
	if questionMarkPos then
		return string.sub(url, 1, questionMarkPos - 1)
	else
		return url
	end
end

return M
