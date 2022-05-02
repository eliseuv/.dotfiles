-- Colorschemes

-- Neon theme options
-- https://github.com/dr4vs/neon.nvim
local neon_opts = {
    neon_style = "doom",
    neon_italic_comment = true,
    neon_italic_keyword = true,
    neon_italic_boolean = false,
    neon_italic_function = false,
    neon_italic_variable = false,
    neon_bold = true,
    neon_transparent = false,
}

-- Tokyo Night theme options
-- https://github.com/folke/tokyonight.nvim
local tokyonight_opts = {
    tokyonight_style = "night",
    tokyonight_terminal_colors = true,
    tokyonight_italic_comments = true,
    tokyonight_italic_keywords = true,
    tokyonight_italic_functions = false,
    tokyonight_italic_variables = false,
    tokyonight_transparent = false,
    tokyonight_hide_inactive_statusline = false,
    tokyonight_sidebars = {"packer", "terminal"},
    tokyonight_transparent_sidebar = false,
    tokyonight_dark_sidebar = true,
    tokyonight_dark_float = true,
    tokyonight_colors = {},
    tokyonight_day_brightness = 0.3,
    tokyonight_lualine_bold = false,
}

-- Apply colorschemes options
for _, opts in ipairs{neon_opts, tokyonight_opts} do
    for k, v in pairs(opts) do
        vim.g[k] = v
    end
end

-- Try to set colorscheme
local colorscheme = "tokyonight"

-- Handle error if colorscheme not available
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
