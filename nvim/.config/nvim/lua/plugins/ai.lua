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
        end,
    },
}
