local backend = "kitty"
local utils = require("utils")
if vim.g.neovide then
	backend = "ueberzug"
end

require("image").setup({
	backend = backend,
	integrations = {
		markdown = {
			enabled = true,
			clear_in_insert_mode = false,
			download_remote_images = true,
			only_render_image_at_cursor = true,
			filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
			resolve_image_path = function(document_path, image_path, fallback)
				local p = utils.remove_query_string(image_path)
				return utils.resolve_absolute_path(document_path, p)
				-- return fallback(document_path, p)
			end,
		},
		neorg = {
			enabled = true,
			clear_in_insert_mode = false,
			download_remote_images = true,
			only_render_image_at_cursor = false,
			filetypes = { "norg" },
		},
	},
	max_width = nil,
	max_height = nil,
	max_width_window_percentage = nil,
	max_height_window_percentage = 50,
	window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
	window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
	editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
	tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
	hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
})
