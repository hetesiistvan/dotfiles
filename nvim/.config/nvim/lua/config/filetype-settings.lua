local M = {}

function M.setup()
    local file_type_group = vim.api.nvim_create_augroup("FileTypeGroup", {clear = true})

    -- Terraform files
    vim.api.nvim_create_autocmd({"BufNewFile", "BufRead", "BufReadPost"}, {
        group = file_type_group,
        pattern = "*.tf",
        callback = function()
            vim.opt.shiftwidth = 2
            vim.opt.filetype = "tf"
        end,
    })

    -- Shell scripts
    vim.api.nvim_create_autocmd({"BufNewFile", "BufRead", "BufReadPost"}, {
        group = file_type_group,
        pattern = "*.lib",
        callback = function()
            vim.opt.filetype = "bash"
            vim.opt.syntax = "bash"
        end,
    })
    vim.api.nvim_create_autocmd({"BufNewFile", "BufRead", "BufReadPost"}, {
        group = file_type_group,
        pattern = "*.sh",
        callback = function()
            vim.opt.filetype = "bash"
            vim.opt.syntax = "bash"
        end,
    })

    -- Makefile
    vim.api.nvim_create_autocmd({"BufNewFile", "BufRead", "BufReadPost"}, {
        group = file_type_group,
        pattern = "*.mk",
        callback = function()
            vim.opt.expandtab = "false"
        end,
    })
    vim.api.nvim_create_autocmd({"BufNewFile", "BufRead", "BufReadPost"}, {
        group = file_type_group,
        pattern = "Makefile",
        callback = function()
            vim.opt.expandtab = "false"
        end,
    })
end

return M
