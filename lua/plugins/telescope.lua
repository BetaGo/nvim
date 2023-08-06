local actions = require("telescope.actions")
local previewers = require("telescope.previewers")

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

-- Telescope
require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules/",
			".git/",
			"dist/",
			"build/",
			"yarn.lock",
			"package-lock.json",
		},
		buffer_previewer_maker = new_maker, -- Ignore files bigger than a threshold
		mappings = {
			i = {
				-- ["<C-u>"] = false,
				-- ["<C-d>"] = false,
				["<C-h>"] = "which_key",
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
