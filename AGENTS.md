# Agent Notes (dotfiles)

- Repo type: dotfiles (no CI/build system detected).
- Cursor/Copilot rules: none found (no `.cursorrules`, no `.cursor/rules/`, no `.github/copilot-instructions.md`).

## Validate (Build/Lint/Test)
- Neovim smoke test (isolated): `XDG_CONFIG_HOME="$PWD/nvim/.config" XDG_DATA_HOME=/tmp/nvim-data nvim`
- Headless healthcheck: `XDG_CONFIG_HOME="$PWD/nvim/.config" XDG_DATA_HOME=/tmp/nvim-data nvim --headless "+checkhealth" +qa`
- Sync plugins (lazy.nvim): `XDG_CONFIG_HOME="$PWD/nvim/.config" XDG_DATA_HOME=/tmp/nvim-data nvim --headless "+Lazy! sync" +qa`
- Lua formatting (check/apply): `stylua --check nvim/.config/nvim` / `stylua nvim/.config/nvim`
- Shell lint/format: `shellcheck shell_settings/common_shell_settings` and `shfmt -d -i 4 shell_settings/common_shell_settings`
- Tests: none detected; validate by opening the relevant app (nvim/tmux/ghostty).

## Code Style (Lua / Neovim)
- Indent: 4 spaces; keep tables/args vertically aligned as-is.
- Prefer `local M = {}` modules with `M.setup()`; avoid implicit globals.
- Options: use `vim.opt` for global defaults; use `vim.bo`/`vim.wo` for buffer/window-local settings.
- Keymaps: use `vim.keymap.set(...)` with `{ desc = ... }`; prefer Lua callbacks over string commands.
- Plugins: keep lazy.nvim specs as `return { ... }`; put config in `config = function()`; avoid extra side effects.
- Error handling: guard external tool calls; prefer `pcall(require, ...)` if optional plugins are introduced.
