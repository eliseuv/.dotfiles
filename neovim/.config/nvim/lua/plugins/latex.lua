return {
    -- Add Haskell to Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            table.insert(opts.ensure_installed, "latex")
        end,
    },
}
