local language_servers = {
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
}

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
                ensure_installed = language_servers,
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

            for _, language_server in pairs(language_servers) do
                vim.lsp.config(language_server, { capabilities = cmp_capabilities })
                vim.lsp.enable(language_server)
            end

            vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "LSP hover" })
            vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP code actions" })
        end,
    },
}
