local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
local trouble = require("trouble.providers.telescope")

require("dir-telescope").setup({
	-- these are the default options set
	hidden = true,
	no_ignore = false,
	show_preview = true,
})

local new_maker = function(filepath, bufnr, opts)
	opts = opts or {}

	filepath = vim.fn.expand(filepath)
	vim.loop.fs_stat(filepath, function(_, stat)
		if not stat then
			return
		end
		if stat.size > 100000 then
			return
		else
			previewers.buffer_previewer_maker(filepath, bufnr, opts)
		end
	end)
end

local copy_selected_entry = function(prompt_bufnr)
	local path = require("telescope.actions.state").get_selected_entry().value
	require("telescope.actions").close(prompt_bufnr)
	local clipboardOpt = vim.opt.clipboard:get()
	local useSystemClipb = #clipboardOpt > 0 and clipboardOpt[1]:find("unnamed")
	local reg = useSystemClipb and "+" or '"'
	vim.fn.setreg(reg, path)
	vim.notify("COPIED \n" .. path)
end

-- Telescope
require("telescope").setup({
	defaults = {
		buffer_previewer_maker = new_maker, -- Ignore files bigger than a threshold
		mappings = {
			i = {
				["<C-y>"] = copy_selected_entry,
				["<c-t>"] = trouble.open_with_trouble,
			},
			n = {
				["<C-y>"] = copy_selected_entry,
				["<c-t>"] = trouble.open_with_trouble,
			},
		},
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		preview = {
			mime_hook = function(filepath, bufnr, opts)
				local is_image = function(filepath)
					local image_extensions = { "png", "jpg", "webp", "ico" } -- Supported image formats
					local split_path = vim.split(filepath:lower(), ".", { plain = true })
					local extension = split_path[#split_path]
					return vim.tbl_contains(image_extensions, extension)
				end
				if is_image(filepath) then
					local term = vim.api.nvim_open_term(bufnr, {})
					local function send_output(_, data, _)
						for _, d in ipairs(data) do
							vim.api.nvim_chan_send(term, d .. "\r\n")
						end
					end
					vim.fn.jobstart({
						"catimg",
						filepath, -- Terminal image viewer command
					}, { on_stdout = send_output, stdout_buffered = true, pty = true })
				else
					require("telescope.previewers.utils").set_preview_message(
						bufnr,
						opts.winid,
						"Binary cannot be previewed"
					)
				end
			end,
		},
	},
	pickers = {
		buffers = {
			mappings = {
				i = {
					["d"] = actions.delete_buffer,
				},
				n = {
					["d"] = actions.delete_buffer,
				},
			},
		},
	},
	extensions = {
		file_browser = {
			hidden = true,
			respect_gitignore = false,

			-- theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),

			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			-- specific_opts = {
			--   [kind] = {
			--     make_indexed = function(items) -> indexed_items, width,
			--     make_displayer = function(widths) -> displayer
			--     make_display = function(displayer) -> function(e)
			--     make_ordinal = function(e) -> string
			--   },
			--   -- for example to disable the custom builtin "codeactions" display
			--      do the following
			--   codeactions = false,
			-- }
		},
	},
})

require("telescope").load_extension("file_browser")
require("telescope").load_extension("ui-select")
require("telescope").load_extension("noice")
require("telescope").load_extension("dir")
require("telescope").load_extension("dap")
require("telescope").load_extension("projects")
require("telescope").load_extension("fzf")
