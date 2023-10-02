vim.api.nvim_create_user_command("Say",
    function(opts)
        require("utils.voice").say_visual_selection()
    end,
    {
        nargs = 0,
        range = '%'
    }
)

