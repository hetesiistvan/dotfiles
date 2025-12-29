return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "v0.1.9",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { silent = true, desc = "Telescope find files" })
            vim.keymap.set("n", "<leader>fg", builtin.grep_string, { silent = true, desc = "Telescope grep text" })
            vim.keymap.set("v", "_g", builtin.grep_string, { silent = true, desc = "Telescope grep selection" })
            vim.keymap.set("n", "<leader>fl", builtin.live_grep, { silent = true, desc = "Telescope live grep" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { silent = true, desc = "Telescope help tags" })
            vim.keymap.set(
                "n",
                "<leader>fc",
                builtin.current_buffer_fuzzy_find,
                { silent = true, desc = "Telescope current buffer fuzzy find" }
            )
            vim.keymap.set(
                "n",
                "<leader>fx",
                builtin.command_history,
                { silent = true, desc = "Telescope command history" }
            )
            vim.keymap.set(
                "n",
                "<leader>fs",
                builtin.search_history,
                { silent = true, desc = "Telescope search history" }
            )
            vim.keymap.set(
                "n",
                "<leader>fu",
                builtin.spell_suggest,
                { silent = true, desc = "Telescope spell suggestions" }
            )
            vim.keymap.set(
                "n",
                "<leader>s",
                "/<C-R><C-W><CR>N",
                { silent = true, desc = "Search the word under the cursor" }
            )
            vim.keymap.set("v", "_s", 'y/<C-R>"<CR>N', { silent = true, desc = "Search the word under the cursor" })
            vim.keymap.set("n", "<leader>c", function()
                vim.fn.setreg("/", "")
            end, { silent = true, desc = "Clear search" })

            require("telescope").setup({
                pickers = {
                    find_files = {
                        hidden = true,
                        no_ignore = true,
                    },
                    live_grep = {
                        additional_args = function()
                            return {
                                "--hidden",
                                "--no-ignore",
                            }
                        end,
                    },
                },
                defaults = {
                    fuzzy = true,
                    file_sorter = require("telescope.sorters").get_fzf_sorter,
                    generic_sorter = require("telescope.sorters").get_fzf_sorter,
                    file_ignore_patterns = {
                        "node_modules/",
                        ".git/",
                        ".terraform/",
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                    fzf = {
                        override_file_sorter = true,
                        override_generic_sorter = true,
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
