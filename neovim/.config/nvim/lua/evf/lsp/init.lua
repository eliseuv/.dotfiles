-- Language Server Protocol
-- https://github.com/neovim/nvim-lspconfig

-- Protected call for nvim-lspconfig
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- LSP installer
-- https://github.com/williamboman/nvim-lsp-installer
require("evf.lsp.lsp-installer")

-- LSP setup
require("evf.lsp.handlers").setup()
