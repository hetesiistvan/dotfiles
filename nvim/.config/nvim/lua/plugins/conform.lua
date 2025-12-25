return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        local max_line_width = 120

        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                terraform = { "terraform_fmt" },
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
                        "--column-width",
                        max_line_width,
                    },
                },
                black = {
                    prepend_args = {
                        "--line-length",
                        max_line_width,
                    },
                },
                prettier = {
                    prepend_args = {
                        "--print-width",
                        max_line_width,
                    },
                },
            },
        })

        vim.opt.textwidth = max_line_width
    end,
}
