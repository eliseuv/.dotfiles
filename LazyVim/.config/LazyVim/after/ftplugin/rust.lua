local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "<leader>cd", function()
    vim.cmd.RustLsp("renderDiagnostic")
end, { desc = "Render diagnostics", buffer = bufnr })

vim.keymap.set("n", "<leader>ce", function()
    vim.cmd.RustLsp({ "explainError", "current" })
end, { desc = "Explain next error", buffer = bufnr })

vim.keymap.set("n", "<leader>ct", function()
    vim.cmd.RustLsp("syntaxTree")
end, { desc = "View syntax tree", buffer = bufnr })

vim.keymap.set("n", "<leader>cE", function()
    vim.cmd.RustLsp("expandMacro")
end, { desc = "Expand macro", buffer = bufnr })

-- vim.keymap.set("n", "<leader>ca", function()
--     vim.cmd.RustLsp("codeAction")
-- end, { desc = "Code actions", buffer = bufnr })

-- Crates in Cargo.toml
vim.keymap.set("n", "<leader>rcu", function()
    require("crates").upgrade_all_crates()
end, { desc = "Update All Crates" })
