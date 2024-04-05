local M = {}

local ESC_FEEDKEY = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)

M.get_visual_lines = function(bufnr)
	vim.api.nvim_feedkeys(ESC_FEEDKEY, "n", true)
	vim.api.nvim_feedkeys("gv", "x", false)
	vim.api.nvim_feedkeys(ESC_FEEDKEY, "n", true)

	local start_row, start_col = unpack(vim.api.nvim_buf_get_mark(bufnr, "<"))
	local end_row, end_col = unpack(vim.api.nvim_buf_get_mark(bufnr, ">"))
	local lines = vim.api.nvim_buf_get_lines(bufnr, start_row - 1, end_row, false)

	-- get whole buffer if there is no current/previous visual selection
	if start_row == 0 then
		lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
		start_row = 1
		start_col = 0
		end_row = #lines
		end_col = #lines[#lines]
	end

	-- use 1-based indexing and handle selections made in visual line mode (see :help getpos)
	start_col = start_col + 1
	end_col = math.min(end_col, #lines[#lines] - 1) + 1

	-- shorten first/last line according to start_col/end_col
	lines[#lines] = lines[#lines]:sub(1, end_col)
	lines[1] = lines[1]:sub(start_col)

	return lines, start_row, start_col, end_row, end_col
end

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
	local lines, start_row, start_col, end_row, end_col = M.get_visual_lines(bufnr)
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

M.nocode = function()
	return vim.fn.exists("g:vscode") == 0
end

M.no_code_and_neovide = function()
	return vim.fn.exists("g:vscode") == 0 and vim.fn.exists("g:neovide") == 0
end

return M
