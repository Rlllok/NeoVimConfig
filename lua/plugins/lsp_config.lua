local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
  clangd = {
    capabilities = {
    },
    cmd = { "clangd" },
    single_file_support = true,
    --root_dir = require("lspconfig.util").root_pattern(".clangd")
  },
  lua_ls = {
  }
}

return {
  {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require("mason-lspconfig").setup_handlers {
        function (server_name)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes
          }

          vim.keymap.set("n", "<leader>sh", vim.lsp.buf.hover, {})
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

          vim.keymap.set("i", "<c-s>", vim.lsp.buf.signature_help, { desc = "Signature help" })
        end
      }
    end
  }
}
