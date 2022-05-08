-- Language Server Protocol
-- https://github.com/neovim/nvim-lspconfig

-- Protected call for nvim-lspconfig
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- LSP configs
require("evf.lsp.configs")

-- LSP setup
require("evf.lsp.handlers").setup()

-- Null LS
require "evf.lsp.null-ls"
