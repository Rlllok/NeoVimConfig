vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({"n", "v"}, "K", "{", { remap = "true" })
vim.keymap.set({"n", "v"}, "J", "}", { remap = "true" })

vim.keymap.set({"n", "v"}, "gf", ":find ", { remap = "true" })

vim.keymap.set({"n", "v"}, "<leader>/", ":norm I// <Enter>", { remap = "true" })
vim.keymap.set({"n", "v"}, "<leader>u/", ":norm 3x <Enter>", { remap = "true" })
