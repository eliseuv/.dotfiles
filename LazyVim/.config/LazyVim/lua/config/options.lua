-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable mouse
vim.opt.mouse = ""

-- Spacing and indentaion
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.wrap = true

-- Spelling
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

-- Python
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff_lsp"

-- GUI config
if vim.g.neovide then
    vim.opt.guifont = "Iosevka Nerd Font:h9"
    --     -- vim.g.neovide_remember_window_size = false
    --     -- vim.g.neovide_fullscreen = true
    vim.g.neovide_theme = "auto"
    -- Transparency
    vim.g.neovide_transparency = 0.95
    -- Particle effects
    vim.g.neovide_cursor_vfx_mode = "pixiedust"
    vim.g.neovide_cursor_vfx_particle_lifetime = 5.0
    vim.g.neovide_cursor_vfx_particle_density = 35.0
end
