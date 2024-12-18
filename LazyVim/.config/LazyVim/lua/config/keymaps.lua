-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- tmux navigation
vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft <cr>", { desc = "Pane Left" })
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight <cr>", { desc = "Pane Right" })
vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown <cr>", { desc = "Pane Down" })
vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp <cr>", { desc = "Pane Up" })
