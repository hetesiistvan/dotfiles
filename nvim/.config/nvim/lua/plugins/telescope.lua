return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "v0.1.9",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
            vim.keymap.set("n", "<leader>fg", builtin.grep_string, { desc = "Telescope grep text" })
            vim.keymap.set("v", "_g", builtin.grep_string, { desc = "Telescope grep selection" })
            vim.keymap.set("n", "<leader>fl", builtin.live_grep, { desc = "Telescope live grep" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
            vim.keymap.set(
                "n",
                "<leader>fc",
                builtin.current_buffer_fuzzy_find,
                { desc = "Telescope current buffer fuzzy find" }
            )
            vim.keymap.set("n", "<leader>fx", builtin.command_history, { desc = "Telescope command history" })
            vim.keymap.set("n", "<leader>fs", builtin.search_history, { desc = "Telescope search history" })
            vim.keymap.set("n", "<leader>fu", builtin.spell_suggest, { desc = "Telescope spell suggestions" })
            vim.keymap.set("n", "<leader>s", "/<C-R><C-W><CR>N", { desc = "Search the word under the cursor" })
            vim.keymap.set("v", "_s", 'y/<C-R>"<CR>N', { desc = "Search the word under the cursor" })
            vim.keymap.set("n", "<leader>c", function()
                vim.fn.setreg("/", "")
            end, { desc = "Clear search" })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
