vim.g.neovide_fullscreen = true
vim.g.neovide_floating_shadows = true
vim.o.guifont = "FiraMono Nerd Font:h12"

vim.keymap.set("n", "<F11>", function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end)
