if vim.g.neovide then
	vim.g.neovide_cursor_vfx_mode = "ripple"
	-- vim.o.guifont = "Fira Code:h13" -- text below applies for VimScript
	vim.o.guifont = "JetBrainsMono Nerd Font Mono,JetBrains Mono,Fira Code,Menlo:h13"
	-- vim.o.guifont = "Fira Code:h13"

	-- vim.g.neovide_floating_blur_amount_x = 2.0
	-- vim.g.neovide_floating_blur_amount_y = 2.0
	vim.g.neovide_underline_stroke_scale = 1.5

	vim.g.neovide_floating_blur_amount_x = 0
	vim.g.neovide_floating_blur_amount_y = 0
	vim.g.neovide_floating_shadow = false
  vim.g.neovide_scroll_animation_length = 0
	-- vim.g.neovide_floating_z_height = 10
	-- vim.g.neovide_light_angle_degrees = 45
	-- vim.g.neovide_light_radius = 5

	vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
end
