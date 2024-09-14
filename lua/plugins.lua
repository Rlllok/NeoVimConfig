local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "cpp", "lua" },
          sync_install = false,
          highlight = {
            enable = true,
          },
        })
    end
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
      { "j-hui/fidget.nvim", opts = {} },
    },
  },

  {
    "nvim-telescope/telescope.nvim", tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" }
  }
})

-- Configure LSP
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, "Rename")

  nmap('gd', "<cmd> lua vim.lsp.buf.definition()<CR>", "Go to definition")
  nmap('gr', "<cmd> lua vim.lsp.buf.references()<CR>", "Show references")
  nmap('gh', "<cmd> lua vim.lsp.buf.hover()<CR>", "Show hover")
end

require('mason').setup()
require('mason-lspconfig').setup()

local servers = {
  clangd = {
    capabilities = {},
    cmd = { "clangd" },
    single_file_support = true,
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
      clangdFileStatus = true,
    },
  },
}

require('neodev').setup()

local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}
