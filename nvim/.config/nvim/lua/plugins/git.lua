return {
    "lewis6991/gitsigns.nvim",
    config = function()
        vim.keymap.set(
            "n",
            "<leader>gp",
            "Gitsigns: preview_hunk<CR>",
            { desc = "Shows the actual git hunk as preview" }
        )
        vim.keymap.set(
            "n",
            "<leader>gb",
            "Gitsigns: toggle_current_line_blame<CR>",
            { desc = "Shows the actual git hunk as preview" }
        )
    end,
}
