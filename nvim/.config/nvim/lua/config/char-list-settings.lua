local M = {}

function M.setup()
    -- vim.opt.listchars = "space:.,nbsp:.,multispace:_,tab:\\u21A3\\u00B7,trail:.,conceal:*,extends:\\u1433,precedes:\\u1438"
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

return M
