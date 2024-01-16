-- local plugin_path = vim.fn.expand("$VIMRUNTIME")
local plugin_path = vim.api.nvim_get_runtime_file("", true)[1]

require("chatgpt").setup({
	openai_edit_params = {
		model = "gpt-4-1106-preview",
		frequency_penalty = 0,
		presence_penalty = 0,
		temperature = 0,
		top_p = 1,
		n = 1,
	},
	-- chat = {
	-- 	welcome_message = WELCOME_MESSAGE,
	-- 	loading_text = "Loading, please wait ...",
	-- 	question_sign = "", -- 🙂
	-- 	answer_sign = "󰚩", -- 🤖
	-- 	border_left_sign = "",
	-- 	border_right_sign = "",
	-- 	max_line_length = 120,
	-- 	sessions_window = {
	-- 		active_sign = " 󰱒 ",
	-- 		inactive_sign = "  ",
	-- 		current_line_sign = "",
	-- 		border = {
	-- 			style = "rounded",
	-- 			text = {
	-- 				top = " Sessions ",
	-- 			},
	-- 		},
	-- 		win_options = {
	-- 			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
	-- 		},
	-- 	},
	-- },
	actions_paths = { plugin_path .. "/chatgpt-actions.json" },
})
