return {
    "lewis6991/gitsigns.nvim",
    config = function()
        vim.keymap.set(
            "n",
            "<leader>gp",
            ":Gitsigns preview_hunk<CR>",
            { silent = true, desc = "Shows the actual git hunk as preview" }
        )
        vim.keymap.set(
            "n",
            "<leader>gb",
            ":Gitsigns toggle_current_line_blame<CR>",
            { silent = true, desc = "Toggles to show the git blame" }
        )
        require("gitsigns").setup()
    end,
}
