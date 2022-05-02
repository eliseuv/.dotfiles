-- Treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter

-- Safely initialize treesitter
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

-- Treesitter config
configs.setup {
    ensure_installed = "all",           -- Either "all" or a list of languages
    sync_install = true,                -- Install languages synchronously
    ignore_install = { "" },            -- List of parsers to ignore installing
    -- Syntax highlighting
    highlight = {
        enable = true,                              -- false will disable the whole extension
        disable = { "" },                           -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    -- Automatic indentation
    indent = {
        enable = true,
        disable = { "yaml" },
    },
    -- Autopairs (https://github.com/windwp/nvim-autopairs)
    -- https://github.com/windwp/nvim-autopairs
    autopairs = {
        enable = true,
    },
    -- Rainbow parenthesis (https://github.com/p00f/nvim-ts-rainbow)
    -- https://github.com/p00f/nvim-ts-rainbow
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    }
}
