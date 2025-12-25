local M = {}

function M.setup()
    local file_type_group = vim.api.nvim_create_augroup("FileTypeGroup", { clear = true })

    -- Terraform files
    vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufReadPost" }, {
        group = file_type_group,
        pattern = "*.tf",
        callback = function()
            vim.bo.shiftwidth = 2
            vim.bo.filetype = "tf"
        end,
    })

    -- Shell scripts
    vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufReadPost" }, {
        group = file_type_group,
        pattern = "*.lib",
        callback = function()
            vim.bo.filetype = "bash"
            vim.bo.syntax = "bash"
        end,
    })
    vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufReadPost" }, {
        group = file_type_group,
        pattern = "*.sh",
        callback = function()
            vim.bo.filetype = "bash"
            vim.bo.syntax = "bash"
        end,
    })

    -- Makefile
    vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufReadPost" }, {
        group = file_type_group,
        pattern = "*.mk",
        callback = function()
            vim.bo.expandtab = false
            vim.bo.filetype = "make"
        end,
    })
    vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufReadPost" }, {
        group = file_type_group,
        pattern = "Makefile",
        callback = function()
            vim.bo.expandtab = false
            vim.bo.filetype = "make"
        end,
    })
end

return M
