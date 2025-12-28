local M = {}

function M.setup()
    -- basic settings
    vim.opt.number = true
    vim.opt.scrolloff = 8
    vim.opt.sidescrolloff = 8
    vim.opt.cursorline = true
    vim.opt.signcolumn = "yes"
    vim.opt.colorcolumn = "100"
    vim.opt.wrap = true
    vim.opt.termguicolors = true
    vim.opt.showmatch = true

    -- Leader key
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    -- tab related settings (global)
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true

    -- file related settings
    vim.opt.autoread = true
    vim.opt.swapfile = false
    vim.opt.backup = false
    vim.opt.writebackup = false
end

return M
