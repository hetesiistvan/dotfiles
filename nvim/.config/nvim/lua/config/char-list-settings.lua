local M = {}

function M.setup()
    vim.opt.listchars = {
        space = ".",
        nbsp = ".",
        multispace = "_",
        tab = "\\u21A3\\u00B7",
        trail = ".",
        conceal = "*",
        extends = "\\u1433",
        precedes = "\\u1438",
    }
    vim.opt.list = true

    local faint = "#586e75"
    local blend_value = 35

    local function set_whitespace_highlights()
        vim.api.nvim_set_hl(0, "Whitespace", {
            fg = faint,
            blend = blend_value,
        })

        vim.api.nvim_set_hl(0, "NonText", {
            fg = faint,
            blend = blend_value,
        })

        vim.api.nvim_set_hl(0, "SpecialKey", {
            fg = faint,
            blend = blend_value,
        })
    end

    -- Set highlights initially
    set_whitespace_highlights()

    -- Reapply after colorscheme changes (e.g., when Solarized loads)
    local color_autocmd_group = vim.api.nvim_create_augroup("WhitespaceHighlights", { clear = true })
    vim.api.nvim_create_autocmd("ColorScheme", {
        group = color_autocmd_group,
        callback = set_whitespace_highlights,
    })
end

return M
