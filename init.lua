vim.cmd("set path+=**")
vim.g.netw_banner = 0
vim.g.netw_browse_split=4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.compatible = false

vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

require("keymaps")
require("color")
require("plugins")
