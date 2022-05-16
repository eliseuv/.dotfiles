-- LSP installer
-- https://github.com/williamboman/nvim-lsp-installer
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

local servers = { "jsonls", "sumneko_lua", "julials" }

lsp_installer.setup({

	-- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer", "sumneko_lua" }
	ensure_installed = servers,

	-- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
	-- Can either be:
	--	 - false: Servers are not automatically installed.
	--	 - true: All servers set up via lspconfig are automatically installed.
	--	 - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
	--			 Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
	automatic_installation = false,

	ui = {
		icons = {
			-- The list icon to use for installed servers.
			server_installed = "◍",
			-- The list icon to use for servers that are pending installation.
			server_pending = "◍",
			-- The list icon to use for servers that are not installed.
			server_uninstalled = "◍",
		},
		keymaps = {
			-- Keymap to expand a server in the UI
			toggle_server_expand = "<CR>",
			-- Keymap to install the server under the current cursor position
			install_server = "i",
			-- Keymap to reinstall/update the server under the current cursor position
			update_server = "u",
			-- Keymap to check for new version for the server under the current cursor position
			check_server_version = "c",
			-- Keymap to update all installed servers
			update_all_servers = "U",
			-- Keymap to check which installed servers are outdated
			check_outdated_servers = "C",
			-- Keymap to uninstall a server
			uninstall_server = "X",
		},
	},

	-- The directory in which to install all servers.
	--install_root_dir = path.concat { vim.fn.stdpath "data", "lsp_servers" },

	pip = {
		-- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
		-- and is not recommended.
		--
		-- Example: { "--proxy", "https://proxyserver" }
		install_args = {},
	},

	-- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
	-- debugging issues with server installations.
	log_level = vim.log.levels.INFO,

	-- Limit for the maximum amount of servers to be installed at the same time. Once this limit is reached, any further
	-- servers that are requested to be installed will be put in a queue.
	max_concurrent_installers = 4,

	on_attach = require("evf.lsp.handlers").on_attach,
	capabilities = require("evf.lsp.handlers").capabilities,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("evf.lsp.handlers").on_attach,
		capabilities = require("evf.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "evf.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end
