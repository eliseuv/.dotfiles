-- LSP Installer
-- https://github.com/williamboman/nvim-lsp-installer

-- Protected call to lsp-installer
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)

    -- General options
    local opts = {

        -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer", "sumneko_lua" }
		ensure_installed = {},

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
    }

    -- JSON
    if server.name == "jsonls" then
	    local jsonls_opts = require("evf.lsp.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

    -- Sumneko Lua
	if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("evf.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

    -- PyRight
	if server.name == "pyright" then
	    local pyright_opts = require("evf.lsp.settings.pyright")
	 	opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
