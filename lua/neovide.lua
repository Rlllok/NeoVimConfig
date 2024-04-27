if vim.g.neovide == true then
  vim.g.neovide_fullscreen = false
  vim.g.neovide_floating_shadows = true
  -- vim.o.guifont = "CodeNewRoman Nerd Font Mono:h11"
  vim.o.guifont = "FiraMono Nerd Font"
  vim.g.neovide_scale_factor = 0.75

  vim.keymap.set("n", "<F11>", function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end)
end
