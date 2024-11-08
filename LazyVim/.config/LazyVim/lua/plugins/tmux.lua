return {

    -- Kitty scrollback
    {
        "mikesmithgh/kitty-scrollback.nvim",
        enabled = true,
        lazy = true,
        cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
        event = { "User KittyScrollbackLaunch" },
        -- version = '*', -- latest stable version, may have breaking changes if major version changed
        -- version = '^5.0.0', -- pin major version, include fixes and features that do not have breaking changes
        config = function()
            require("kitty-scrollback").setup()
        end,
    },

    -- Integrate nvim pane navigation with tmux
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
}
