return {
    "hrsh7th/nvim-cmp",
    dependencies = { "f3fora/cmp-spell" },
    opts = function(_, opts)
        opts.view = {
            entries = { name = "custom", selection_order = "near_cursor" },
        }
        table.insert(opts.sources, { name = "spell" })
    end,
}
