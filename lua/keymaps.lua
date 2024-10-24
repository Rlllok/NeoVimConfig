vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Change to other window (suitable for two windows setup)
vim.keymap.set("n", "<leader>w", "<C-w>w")

-- Exit from terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set({"n", "v"}, "K", "{", { remap = "true" })
vim.keymap.set({"n", "v"}, "J", "}", { remap = "true" })

vim.keymap.set({"n", "v"}, "<leader>r", ":s/", { remap = "true" })

