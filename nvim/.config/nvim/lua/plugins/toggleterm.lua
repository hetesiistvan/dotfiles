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
    end,
}
