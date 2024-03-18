if vim.g.neovide == true then
    vim.g.neovide_fullscreen = true
    vim.o.guifont = "CodeNewRoman Nerd Font Mono:h14"
    vim.g.neovide_scale_factor = 0.8
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.wo.number = true
vim.wo.relativenumber = true
vim.o.hlsearch = false

vim.o.scrolloff = 5

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- disable autro comments on new line
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

-- Keymaps
vim.keymap.set({"n", "v"}, "K", "{", { remap = true })
vim.keymap.set({"n", "v"}, "J", "}", { remap = true })

vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<leader>v", function() vim.cmd("vsplit") end)
vim.keymap.set("n", "<leader>q", function() vim.cmd("q") end)

vim.keymap.set({"n", "v"}, "<leader>y", "\"*y")
vim.keymap.set({"n", "v"}, "<leader>p", "\"*p")

-- Plugins
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
-- One Liners
    "folke/neodev.nvim",

-- Lualine
{
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            icons_enabled = false,
            theme = "jellybeans",
            componennts_seperatores = "|",
            section_separator = "",
        },
    },
},

-- LSP
{
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        "williamboman/mason-lspconfig.nvim",
        "folke/neodev.nvim",
        { "j-hui/fidget.nvim", opts = {} },
    },
},

-- Complition
{
    "hrsh7th/nvim-cmp",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",

        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
    },
},

-- Highlight etc.
{
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        'nvim-treesitter/playground'
    },
    build = ":TSUpdate",
},

-- Telescope Searching
{
    "nvim-telescope/telescope.nvim", tah = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" }
},

-- Comment
{
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
},

})

-- Setup comment
require("Comment").setup {
    toggler = {
        line = "<leader>/",
    },
}

-- Treesitter Setup
vim.defer_fn(function()
    require("nvim-treesitter.configs").setup {
        ensure_installed = { "c", "cpp", "lua", "rust" },

        auto_install = false,

        hightlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
}
    }
end, 0)

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  -- nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gd', go_to_definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('<leader>h', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end


-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
    clangd = {},
    rust_analyzer = {},
    lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
          -- diagnostics = { disable = { 'missing-fields' } },
        },
    },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
      autocomplete = false,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  window = {
      completion = cmp.config.window.bordered(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  },
}

-- Setup Telescope --------------------------------------------------
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>c", builtin.find_files, {})
vim.keymap.set("n", "<leader>s", builtin.lsp_workspace_symbols, {})

-- Setup Custom Theme--------------------------------------------------
-- :h group-name - shows names of groups with explanation
-- :hi - to check all active groups
vim.o.background = "dark"
vim.o.cursorline = true
vim.cmd("syntax reset")
vim.o.termguicolors = true

-- local black = "#1A1E23"
local black = "#121519"

local background_color = black
local cursor_background_color = "#282E36"
local line_number_color = "#999999"
local cursor_line_number_color = line_number_color
local normal_color = "#d2bda2"
local comment_color = "#b34545"
local string_color = "#81796f"
local type_color = "#a198cd"
local identifier_color = normal_color
local statement_color = "#89b5b9"
local operator_color = normal_color
local function_color = "#98afcd"
local preproc_color = "#cd98c9"

vim.api.nvim_set_hl(0, "LineNr", { fg = line_number_color })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = cursor_line_number_color,
    bg = cursor_background_color
})
-- Text
vim.api.nvim_set_hl(0, "Normal", { fg = normal_color, bg = background_color })
vim.api.nvim_set_hl(0, "Pmenu", { fg = normal_color, bg = background_color })
vim.api.nvim_set_hl(0, "Identifier", { fg = identifier_color })
vim.api.nvim_set_hl(0, "Constant", { fg = normal_color })
vim.api.nvim_set_hl(0, "String", { fg = string_color })
vim.api.nvim_set_hl(0, "Type", { fg = type_color })
vim.api.nvim_set_hl(0, "Function", { fg = function_color })
vim.api.nvim_set_hl(0, "PreProc", { fg = preproc_color })
vim.api.nvim_set_hl(0, "Statement", { fg = statement_color })
vim.api.nvim_set_hl(0, "Operator", { fg = operator_color })
vim.api.nvim_set_hl(0, "Comment", { fg = comment_color })
vim.api.nvim_set_hl(0, "CursorLine", { bg = cursor_background_color })
vim.api.nvim_set_hl(0, "@lsp.type.enumMember", { fg = statement_color })

vim.diagnostic.disable()
