return {
    "akinsho/toggleterm.nvim",
    config = function()
        local Terminal = require("toggleterm.terminal").Terminal

        local lazygit = nil

        local function lazygit_open()
            if lazygit == nil then
                lazygit = Terminal:new({
                    cmd = "lazygit",
                    direction = "float",
                    hidden = false,
                    float_opts = {
                        border = "double",
                    },
                    on_open = function(term)
                        vim.cmd("startinsert!")
                        vim.api.nvim_buf_set_keymap(
                            term.bufnr,
                            "n",
                            "q",
                            "<cmd>close<CR>",
                            { noremap = true, silent = true }
                        )
                    end,
                })
            end
            lazygit:toggle()
        end

        vim.keymap.set(
            "n",
            "<leader>gl",
            lazygit_open,
            { noremap = true, silent = true, desc = "Toggle LazyGit terminal" }
        )

        local h_terminal = nil

        local function h_terminal_open()
            if h_terminal == nil then
                h_terminal = Terminal:new({
                    direction = "horizontal",
                    hidden = false,
                    size = 20,
                    on_open = function()
                        vim.cmd("startinsert!")
                    end,
                })
            end
            h_terminal:toggle()
        end

        vim.keymap.set(
            "n",
            "<leader>eh",
            h_terminal_open,
            { noremap = true, silent = true, desc = "Toggle horizontal terminal" }
        )

        local f_terminal = nil

        local function f_terminal_open()
            if f_terminal == nil then
                f_terminal = Terminal:new({
                    direction = "float",
                    hidden = false,
                    size = 20,
                    on_open = function()
                        vim.cmd("startinsert!")
                    end,
                })
            end
            f_terminal:toggle()
        end

        vim.keymap.set(
            "n",
            "<leader>ef",
            f_terminal_open,
            { noremap = true, silent = true, desc = "Toggle floating terminal" }
        )

        local pr_terminal = nil

        local function pr_terminal_open()
            if pr_terminal == nil then
                pr_terminal = Terminal:new({
                    cmd = "gh pr create",
                    direction = "float",
                    hidden = false,
                    size = 20,
                    on_open = function()
                        vim.cmd("startinsert!")
                    end,
                })
            end
            pr_terminal:toggle()
        end

        vim.keymap.set(
            "n",
            "<leader>gg",
            pr_terminal_open,
            { noremap = true, silent = true, desc = "Toggle Pull Request terminal" }
        )
    end,
}
