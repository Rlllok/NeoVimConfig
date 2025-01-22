vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.scrolloff = 5

vim.diagnostic.config({  -- https://neovim.io/doc/user/diagnostic.html
  virtual_text = false,
  signs = false,
  underline = false,
})
