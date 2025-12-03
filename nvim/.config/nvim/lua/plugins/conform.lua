return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                tf = { "terraform_fmt" },
                go = { "gofmt" },
                bash = { "shfmt" },
                yaml = { "prettier" },
                ["*"] = { "trim_whitespace" },
            },
            format_on_save = {
                async = false,
                timeout_ms = 500,
                lsp_format = "never",
            },
            formatters = {
                shfmt = {
                    prepend_args = {
                        "-i",
                        "4",
                    },
                },
                stylua = {
                    prepend_args = {
                        "--indent-type",
                        "Spaces",
                        "--indent-width",
                        "4",
                    },
                },
            },
        })
    end,
}
