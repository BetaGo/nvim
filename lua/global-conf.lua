-- " Trigger a highlight in the appropriate direction when pressing these keys=
vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


if os.getenv("SSH_FROM_KITTY") then
    local function copy(lines, _)
        require('osc52').copy(table.concat(lines, '\n'))
    end

    local function paste()
        return { vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('') }
    end

    vim.g.clipboard = {
        name = 'osc52',
        copy = { ['+'] = copy, ['*'] = copy },
        paste = { ['+'] = paste, ['*'] = paste },
    }
end
