return {
    {
        "github/copilot.vim",
    },
    {
        "NickvanDyke/opencode.nvim",
        dependencies = {
            { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
        },
        config = function()
            local cwd = vim.fn.getcwd()
            local opencode_port = 8000

            if cwd:match("dotfiles") then
                opencode_port = 8001
            elseif cwd:match("infrastructure") then
                opencode_port = 8002
            end

            vim.g.opencode_opts = {
                port = opencode_port,
                provider = {
                    -- Configure opencode to use Neovim's built-in terminal
                    enabled = "terminal",
                    terminal = {
                        split = "below",
                        height = math.floor(vim.o.lines * 0.5),
                    },
                },
            }

            -- Define user commands for easier access
            vim.api.nvim_create_user_command("OpencodeAsk", function(opts)
                require("opencode").ask(opts.args)
            end, { nargs = "*", desc = "Ask opencode a question" })
            vim.api.nvim_create_user_command("OpencodeSelect", function()
                require("opencode").select()
            end, { desc = "Select opencode action" })
            vim.api.nvim_create_user_command("OpencodeToggle", function()
                require("opencode").toggle()
            end, { desc = "Toggle opencode terminal" })
            vim.api.nvim_create_user_command("OpencodeStart", function()
                require("opencode").start()
            end, { desc = "Start opencode" })
            vim.api.nvim_create_user_command("OpencodeStop", function()
                require("opencode").stop()
            end, { desc = "Stop opencode" })
            vim.api.nvim_create_user_command("OpencodePrompt", function(opts)
                require("opencode").prompt(opts.args)
            end, { nargs = "+", desc = "Send prompt to opencode" })
            vim.api.nvim_create_user_command("OpencodeCommand", function(opts)
                require("opencode").command(opts.args)
            end, { nargs = 1, desc = "Execute opencode command" })

            -- toggle opencode terminal with keybindings in normal and terminal modes
            vim.keymap.set("n", "<leader>to", function()
                require("opencode").toggle()
            end, { noremap = true, silent = true, desc = "Toggle opencode terminal in normal mode" })
            vim.keymap.set("t", "<C-t>o", function()
                require("opencode").toggle()
            end, { noremap = true, silent = true, desc = "Toggle opencode terminal in terminal mode" })

            -- vim.keymap.set({ "n", "x" }, "<C-a>", function()
            --     require("opencode").ask("@this: ", { submit = true })
            -- end, { desc = "Ask opencode…" })
            -- vim.keymap.set({ "n", "x" }, "<C-x>", function()
            --     require("opencode").select()
            -- end, { desc = "Execute opencode action…" })
            -- vim.keymap.set({ "n", "t" }, "<C-.>", function()
            --     require("opencode").toggle()
            -- end, { desc = "Toggle opencode" })

            -- vim.keymap.set({ "n", "x" }, "go", function()
            --     return require("opencode").operator("@this ")
            -- end, { desc = "Add range to opencode", expr = true })
            -- vim.keymap.set("n", "goo", function()
            --     return require("opencode").operator("@this ") .. "_"
            -- end, { desc = "Add line to opencode", expr = true })

            -- vim.keymap.set("n", "<S-C-u>", function()
            --     require("opencode").command("session.half.page.up")
            -- end, { desc = "Scroll opencode up" })
            -- vim.keymap.set("n", "<S-C-d>", function()
            --     require("opencode").command("session.half.page.down")
            -- end, { desc = "Scroll opencode down" })

            -- -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o…".
            -- vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
            -- vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
        end,
    },
}
