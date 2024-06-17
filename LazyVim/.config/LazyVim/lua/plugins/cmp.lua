return {
    "hrsh7th/nvim-cmp",
    dependencies = { "f3fora/cmp-spell" },
    opts = function(_, opts)
        opts.view = {
            entries = { name = "custom", selection_order = "near_cursor" },
        }
        table.insert(
            opts.sources,
            {
                name = "spell",
                option = {
                    enable_in_context = function(params)
                        return require("cmp.config.context").in_treesitter_capture("spell")
                    end,
                    preselect_correct_word = false,
                },
            }
        )
    end,
}
