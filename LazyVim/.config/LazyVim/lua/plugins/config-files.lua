return {
    -- Tree-sitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "toml")
        end,
    },

    -- Tridactyl config file syntax
    { "tridactyl/vim-tridactyl" },

    -- -- kdl: cuddly document language
    -- { "imsnif/kdl.vim" },

    -- Kitty config file
    { "fladson/vim-kitty" },
}
