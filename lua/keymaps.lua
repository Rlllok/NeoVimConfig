vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable autro comments on new line
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

-- Keymaps
vim.keymap.set({"n", "v"}, "K", "5k", { remap = true })
vim.keymap.set({"n", "v"}, "J", "5j", { remap = true })

vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<leader>v", function() vim.cmd("vsplit") end)
vim.keymap.set("n", "<leader>q", function() vim.cmd("q") end)

vim.keymap.set({"n", "v"}, "<leader>y", "\"*y")
vim.keymap.set({"n", "v"}, "<leader>p", "\"*p") 

vim.keymap.set("n", "<leader>-", "70A-<Esc>70d|", { remap = true })
