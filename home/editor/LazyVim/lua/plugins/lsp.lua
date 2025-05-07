return {

  {
    "williamboman/mason.nvim",
    -- Pin version
    version = "1.11.0",
    -- enabled = false,
    opts = {
      -- Prefer local binaries over mason binaries
      PATH = "append",
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    -- Pin version
    version = "1.32.0",
  },
}
