return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false,
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
                filesystem = {
                    filtered_items = {
                        hide_dotfiles = false,
                        hide_gitignored = false,
                    },
                },
            })

            vim.keymap.set(
                "n",
                "<leader>nn",
                ":Neotree filesystem left<CR>",
                { desc = "Open Neotree filesystem wo revealing" }
            )
            vim.keymap.set(
                "n",
                "<leader>nr",
                ":Neotree filesystem reveal left<CR>",
                { desc = "Open Neotre filesystem with revealing" }
            )
            vim.keymap.set("n", "<leader>nc", ":Neotree close<CR>", { desc = "Neotree close" })
            vim.keymap.set("n", "<leader>nb", ":Neotree buffers<CR>", { desc = "Neotree show buffers" })
            vim.keymap.set("n", "<leader>ng", ":Neotree git_status<CR>", { desc = "Neotree show git status" })
            vim.keymap.set(
                "n",
                "<leader>ns",
                ":Neotree document_symbols<CR>",
                { desc = "Neotree show document symbols" }
            )
        end,
    },
}
