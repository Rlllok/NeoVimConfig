-- Setup Custom Theme--------------------------------------------------
-- :h group-name - shows names of groups with explanation
-- :hi - to check all active groups
vim.o.cursorline = true
vim.o.termguicolors = true

local black        = "#121519"
local green        = "#9db989"
local earth_yellow = "#c69a60"
local cerise       = "#da4167"
local process_cyan = "#01baef"
local periwinkle   = "#C9DDFF"

local background_color         = "#181825"
local normal_color             = "#ddc7c6"
local indentation_color        = "#2a2c30"
local cursor_background_color  = "#1e1e2e"
local line_number_color        = "#999999"
local cursor_line_number_color = line_number_color
local comment_color            = "#81796f"
local constant_color           = "#fab387"
local string_color             = "#81796f"
local type_color               = "#fab387"
local identifier_color         = normal_color
local function_color           = "#f38ba8"
local preproc_color            = "#89b4fa"
local statement_color          = preproc_color
local enum_member_color        = "#a6e3a1"

vim.api.nvim_set_hl(0, "Cursor",                    { bg = green })

vim.api.nvim_set_hl(0, "LineNr",                    { fg = line_number_color })
vim.api.nvim_set_hl(0, "CursorLineNr",              { fg = cursor_line_number_color, bg = cursor_background_color})
-- Text
vim.api.nvim_set_hl(0, "Normal",                    { fg = normal_color, bg = background_color })
vim.api.nvim_set_hl(0, "Visual",                    { bg = "#595b5e"})
vim.api.nvim_set_hl(0, "Pmenu",                     { fg = normal_color, bg = background_color })
vim.api.nvim_set_hl(0, "Identifier",                { fg = identifier_color })
vim.api.nvim_set_hl(0, "Constant",                  { fg = constant_color })
vim.api.nvim_set_hl(0, "Special",                   { fg = constant_color })
vim.api.nvim_set_hl(0, "Type",                      { fg = type_color })
vim.api.nvim_set_hl(0, "Function",                  { fg = function_color })
vim.api.nvim_set_hl(0, "PreProc",                   { fg = preproc_color })
vim.api.nvim_set_hl(0, "Statement",                 { fg = statement_color })
vim.api.nvim_set_hl(0, "Operator",                  { fg = normal_color })
vim.api.nvim_set_hl(0, "Comment",                   { fg = comment_color })
vim.api.nvim_set_hl(0, "CursorLine",                { bg = cursor_background_color })
vim.api.nvim_set_hl(0, "@lsp.type.enumMember",      { fg = enum_member_color })
vim.api.nvim_set_hl(0, "NonText",                   { fg = ceriseo })
vim.api.nvim_set_hl(0, "@punctuation.bracket.cpp",  { fg = normal_color})
vim.api.nvim_set_hl(0, "@punctuation.delimiter.cpp",{ fg = normal_color})
vim.api.nvim_set_hl(0, "@lsp.type.parameter.cpp",   { fg = normal_color })
vim.api.nvim_set_hl(0, "@lsp.type.property.cpp",    {})

-- vim.api.nvim_set_hl(0, '@lsp.type.comment.cpp', {})
vim.api.nvim_set_hl(0, '@constructor.cpp', {})
vim.api.nvim_set_hl(0, "@number.cpp", {})
vim.api.nvim_set_hl(0, "@keyword.repeat.cpp",       {})
vim.api.nvim_set_hl(0, "@keyword.conditional.cpp",  {})
