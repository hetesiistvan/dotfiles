return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local treesitter_config = require('nvim-treesitter.configs')
        treesitter_config.setup({
            ensure_installed = {'lua', 'vim', 'bash', 'awk', 'csv', 'diff', 'dockerfile', 'git_config', 'gitignore', 'go', 'java', 'jq', 'json', 'make', 'markdown', 'python', 'regex', 'sql', 'ssh_config', 'terraform', 'xml', 'yaml'},
            highlight = {enable = true},
            indent = {enable = true},
        })
    end,
}
