return {
    {
        "mason-org/mason.nvim",
        opts = {},
        config = function()
            require("mason").setup()

            vim.keymap.set("n", "<leader>M", ":Mason<CR>", { desc = "Launch Mason UI" })
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "bashls",
                    "awk_ls",
                    "dockerls",
                    "gopls",
                    "jdtls",
                    "jqls",
                    "jsonls",
                    "marksman",
                    "pyright",
                    "sqls",
                    "terraformls",
                    "lemminx",
                    "yamlls",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.lsp.config("lua_ls", { capabilities = cmp_capabilities })
            vim.lsp.enable("lua_ls")
            vim.lsp.config("bashls", { capabilities = cmp_capabilities })
            vim.lsp.enable("bashls")
            vim.lsp.config("awk_ls", { capabilities = cmp_capabilities })
            vim.lsp.enable("awk_ls")
            vim.lsp.config("dockerls", { capabilities = cmp_capabilities })
            vim.lsp.enable("dockerls")
            vim.lsp.config("gopls", { capabilities = cmp_capabilities })
            vim.lsp.enable("gopls")
            vim.lsp.config("jdtls", { capabilities = cmp_capabilities })
            vim.lsp.enable("jdtls")
            vim.lsp.config("jqls", { capabilities = cmp_capabilities })
            vim.lsp.enable("jqls")
            vim.lsp.config("jsonls", { capabilities = cmp_capabilities })
            vim.lsp.enable("jsonls")
            vim.lsp.config("marksman", { capabilities = cmp_capabilities })
            vim.lsp.enable("marksman")
            vim.lsp.config("pyright", { capabilities = cmp_capabilities })
            vim.lsp.enable("pyright")
            vim.lsp.config("sqls", { capabilities = cmp_capabilities })
            vim.lsp.enable("sqls")
            vim.lsp.config("terraformls", { capabilities = cmp_capabilities })
            vim.lsp.enable("terraformls")
            vim.lsp.config("lemminx", { capabilities = cmp_capabilities })
            vim.lsp.enable("lemminx")
            vim.lsp.config("yamlls", { capabilities = cmp_capabilities })
            vim.lsp.enable("yamlls")

            vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "LSP hover" })
            vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP code actions" })
        end,
    },
}
