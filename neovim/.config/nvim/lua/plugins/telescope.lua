return {
    "nvim-telescope/telescope.nvim",
    opts = {
        pickers = {
            find_files = {
                find_command = { "rg", "--ignore", "--follow", "--hidden", "--files" },
            },
        },
    },
    keys = {
        -- -- disable the keymap to grep files
        -- {"<leader>/", false},
        -- -- change a keymap
        -- { "<leader>ff", "Telescope find_files" desc = "Find Files" },
        -- add a keymap to browse plugin files
        {
            "<leader>fp",
            function()
                require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
            end,
            desc = "Find Plugin File",
        },
    },
}
