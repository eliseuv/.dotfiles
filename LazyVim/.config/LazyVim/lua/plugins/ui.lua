return {

    -- Themes
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            transparent_background = true,
        },
    },
    { "dasupradyumna/midnight.nvim", opts = {} },
    {
        "folke/tokyonight.nvim",
        opts = {
            style = "night",
            -- transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
        dim_inactive = true,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            -- colorscheme = "catppuccin-mocha",
            -- colorscheme = "midnight",
            colorscheme = "tokyonight",
        },
    },

    -- Dashboard
    {
        "folke/snacks.nvim",
        opts = {
            dashboard = {
                preset = {
                    header = [[
=================     ===============     ===============   ========  ========
\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
||.=='    _-'                                                     `' |  /==.||
=='    _-'                        N E O V I M                         \/   `==
\   _-'                                                                `-_   /
 `''                                                                      ``']],
                    -- stylua: ignore
                    ---@type snacks.dashboard.Item[]
                    keys = {
                        { icon = " ", key = "n", desc = "New File",        action = ":ene | startinsert" },
                        { icon = " ", key = "r", desc = "Recent Files",    action = ":lua Snacks.dashboard.pick('oldfiles')" },
                        { icon = " ", key = "f", desc = "Find File",       action = ":lua Snacks.dashboard.pick('files')" },
                        { icon = " ", key = "g", desc = "Find Text",       action = ":lua Snacks.dashboard.pick('live_grep')" },
                        { icon = " ", key = "d", desc = "Dotfiles",        action = ":lua Snacks.dashboard.pick('files', {cwd = \"~/.dotfiles/\"})" },
                        { icon = " ", key = "c", desc = "Config",          action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                        { icon = "󰒲 ", key = "l", desc = "Lazy",            action = ":Lazy" },
                        { icon = " ", key = "x", desc = "Lazy Extras",     action = ":LazyExtras" },
                        { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                        { icon = " ", key = "q", desc = "Quit",            action = ":qa" },
                    },
                },
            },
        },
    },

    -- Minimap
    ---@module "neominimap.config.meta"
    {
        "Isrothy/neominimap.nvim",
        enabled = true,
        lazy = false, -- NOTE: NO NEED to Lazy load
        -- Optional
        keys = {
            { "<leader>nt", "<cmd>Neominimap toggle<cr>", desc = "Toggle minimap" },
            { "<leader>no", "<cmd>Neominimap on<cr>", desc = "Enable minimap" },
            { "<leader>nc", "<cmd>Neominimap off<cr>", desc = "Disable minimap" },
            { "<leader>nf", "<cmd>Neominimap focus<cr>", desc = "Focus on minimap" },
            { "<leader>nu", "<cmd>Neominimap unfocus<cr>", desc = "Unfocus minimap" },
            { "<leader>ns", "<cmd>Neominimap toggleFocus<cr>", desc = "Toggle focus on minimap" },
            { "<leader>nwt", "<cmd>Neominimap winToggle<cr>", desc = "Toggle minimap for current window" },
            { "<leader>nwr", "<cmd>Neominimap winRefresh<cr>", desc = "Refresh minimap for current window" },
            { "<leader>nwo", "<cmd>Neominimap winOn<cr>", desc = "Enable minimap for current window" },
            { "<leader>nwc", "<cmd>Neominimap winOff<cr>", desc = "Disable minimap for current window" },
            { "<leader>nbt", "<cmd>Neominimap bufToggle<cr>", desc = "Toggle minimap for current buffer" },
            { "<leader>nbr", "<cmd>Neominimap bufRefresh<cr>", desc = "Refresh minimap for current buffer" },
            { "<leader>nbo", "<cmd>Neominimap bufOn<cr>", desc = "Enable minimap for current buffer" },
            { "<leader>nbc", "<cmd>Neominimap bufOff<cr>", desc = "Disable minimap for current buffer" },
        },
        init = function()
            vim.opt.wrap = false -- Recommended
            vim.opt.sidescrolloff = 36 -- It's recommended to set a large value
            ---@type Neominimap.UserConfig
            vim.g.neominimap = {
                auto_enable = true,

                search = {
                    enabled = true, ---@type boolean
                    mode = "sign", ---@type Neominimap.Handler.MarkMode
                    priority = 20, ---@type integer
                },

                buf_filter = function(bufnr)
                    local line_count = vim.api.nvim_buf_line_count(bufnr)
                    return line_count > 64 and line_count < 4096
                end,
            }
        end,
    },

    -- oil.nvim
    {
        "stevearc/oil.nvim",
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },
}
