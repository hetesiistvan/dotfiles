local M = {}

function M.setup()
    -- basic settings
    vim.opt.number = true
    vim.opt.cursorline = true

    -- Leader key
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    -- tab related settings (global)
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
end

return M
