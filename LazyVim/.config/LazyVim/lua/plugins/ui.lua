return {

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

    -- Tokyo Night
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

    -- Catppuccin
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            transparent_background = true,
        },
    },

    -- Midnight colorscheme
    { "dasupradyumna/midnight.nvim", opts = {} },

    -- Select theme
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
            -- colorscheme = "midnight",
            -- colorscheme = "catppuccin-mocha",
        },
    },

    {
        "nvimdev/dashboard-nvim",
        lazy = false,
        opts = function()
            local logo = [[
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
     `''                                                                      ``'
                    ]]

            logo = string.rep("\n", 8) .. logo .. "\n\n"

            -- local opts = {}
            local opts = {
                theme = "doom",
                hide = {
                    -- this is taken care of by lualine
                    -- enabling this messes up the actual laststatus setting after loading a file
                    statusline = false,
                },
                config = {
                    header = vim.split(logo, "\n"),
                    -- stylua: ignore
                    center = {
                        { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
                        { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
                        { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
                        { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
                        { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
                        { action = "Telescope find_files search_dirs=~/.dotfiles find_command=rg,--hidden,--files", desc = " Browse Dotfiles", icon = " ", key = "d" },
                        { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
                        { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
                        { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
                        { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
                    },
                    footer = function()
                        local stats = require("lazy").stats()
                        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                        return {
                            "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
                        }
                    end,
                },
            }

            for _, button in ipairs(opts.config.center) do
                button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
                button.key_format = "  %s"
            end

            -- close Lazy and re-open when the dashboard is ready
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "DashboardLoaded",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            return opts
        end,
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
}
