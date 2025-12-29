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

    -- line moving and indentation
    vim.keymap.set("n", "<Tab>h", "<<", { silent = true, desc = "Indent line left (normal mode)" })
    vim.keymap.set("n", "<Tab>l", ">>", { silent = true, desc = "Indent line right (normal mode)" })
    vim.keymap.set("v", "<Tab>h", "<gv", { silent = true, desc = "Indent line left (visual mode)" })
    vim.keymap.set("v", "<Tab>l", ">gv", { silent = true, desc = "Indent line right (visual mode)" })
    vim.keymap.set("n", "<Tab>k", ":m .-2<CR>==", { silent = true, desc = "Move line up (normal mode)" })
    vim.keymap.set("n", "<Tab>j", ":m .+1<CR>==", { silent = true, desc = "Move line down (normal mode)" })
    vim.keymap.set("v", "<Tab>k", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move line up (visual mode)" })
    vim.keymap.set("v", "<Tab>j", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move line down (visual mode)" })

    -- window management
    local window_command_group = vim.api.nvim_create_augroup("WindowManagement", { clear = true })
    vim.api.nvim_create_autocmd("VimResized", {
        group = window_command_group,
        callback = function()
            vim.cmd("tabdo wincmd =")
        end,
    })
end

return M
