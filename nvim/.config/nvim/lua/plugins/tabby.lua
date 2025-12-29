return {
    "nanozuki/tabby.nvim",
    config = function()
        local theme = {
            fill = "TabLineFill",
            -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
            head = "TabLine",
            current_tab = "TabLineSel",
            tab = "TabLine",
            -- Use the :hi command to list the available highlight groups
            win = { fg = "#568e75", bg = "#0c4e53", style = "italic" },
            tail = "TabLine",
        }
        require("tabby").setup({
            line = function(line)
                return {
                    {
                        { "  ", hl = theme.head },
                        line.sep("", theme.head, theme.fill),
                    },
                    line.tabs().foreach(function(tab)
                        local hl = tab.is_current() and theme.current_tab or theme.tab
                        return {
                            line.sep("", hl, theme.fill),
                            tab.is_current() and "" or "󰆣",
                            tab.number(),
                            tab.jump_key(),
                            tab.name(),
                            tab.close_btn(""),
                            line.sep("", hl, theme.fill),
                            hl = hl,
                            margin = " ",
                        }
                    end),
                    line.spacer(),
                    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
                        return {
                            line.sep("", theme.win, theme.fill),
                            win.is_current() and "" or "",
                            win.buf_name(),
                            line.sep("", theme.win, theme.fill),
                            hl = theme.win,
                            margin = " ",
                        }
                    end),
                    {
                        line.sep("", theme.tail, theme.fill),
                        { "  ", hl = theme.tail },
                    },
                    hl = theme.fill,
                }
            end,
        })
        vim.o.showtabline = 2

        -- Setting up keyboard shortcuts
        vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { silent = true, desc = "Open a new tab" })
        vim.keymap.set(
            "n",
            "<leader>tj",
            ":Tabby jump_to_tab<CR>",
            { silent = true, desc = "Jump to a tab (in jump mode)" }
        )
        vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { silent = true, desc = "Close the current tab" })
        vim.keymap.set("n", "<leader>tl", ":tablast<CR>", { silent = true, desc = "Jump to the last tab" })
    end,
}
