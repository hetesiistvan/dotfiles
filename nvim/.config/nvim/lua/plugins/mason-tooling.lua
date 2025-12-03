return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
        require("mason-tool-installer").setup({
            ensure_installed = {
                "shellcheck",
                "shfmt",
                "stylua",
                "black",
                "prettier",
            },
            auto_update = false,
            run_on_start = true,
        })
    end,
}
