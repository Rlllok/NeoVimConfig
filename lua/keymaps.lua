vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({"n", "v"}, "K", "{", { remap = "true" })
vim.keymap.set({"n", "v"}, "J", "}", { remap = "true" })

vim.keymap.set({"n", "v"}, "gf", ":find ", { remap = "true" })

vim.keymap.set({"n", "v"}, "<leader>/", ":norm I// <Enter>", { remap = "true" })
vim.keymap.set({"n", "v"}, "<leader>u/", ":norm 3x <Enter>", { remap = "true" })

vim.keymap.set({"n", "v"}, "<leader>r", ":s/", { remap = "true" })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
