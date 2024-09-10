-- Setup Custom Theme--------------------------------------------------
-- :h group-name - shows names of groups with explanation
-- :hi - to check all active groups
vim.o.cursorline = true
vim.o.termguicolors = true

-- local black = "#1A1E23"
local black        = "#121519"
local green        = "#9db989"
local earth_yellow = "#c69a60"
local cerise       = "#da4167"
local process_cyan = "#01baef"
local periwinkle   = "#C9DDFF"

local background_color         = "#100d10"--black
local indentation_color        = "#2a2c30"
local cursor_background_color  = "#282E36"
local line_number_color        = "#999999"
local cursor_line_number_color = line_number_color
local normal_color             = "#bbb096"
local comment_color            = "#81796f"
local string_color             = "#81796f"
local type_color               = "#f4bf42"
local identifier_color         = normal_color
local statement_color          = "#9cd3ba"
local operator_color           = cerise
local function_color           = "#dc403d"
local preproc_color            = "#207aaf"
local enum_member_color        = "#f3ffc9"

vim.api.nvim_set_hl(0, "LineNr",                    { fg = line_number_color })
vim.api.nvim_set_hl(0, "CursorLineNr",              { fg = cursor_line_number_color, bg = cursor_background_color})
-- Text
vim.api.nvim_set_hl(0, "Normal",                    { fg = normal_color, bg = background_color })
vim.api.nvim_set_hl(0, "Visual",                    { bg = "#595b5e"})
vim.api.nvim_set_hl(0, "Pmenu",                     { fg = normal_color, bg = background_color })
vim.api.nvim_set_hl(0, "Identifier",                { fg = identifier_color })
vim.api.nvim_set_hl(0, "Constant",                  { fg = type_color })
vim.api.nvim_set_hl(0, "Type",                      { fg = type_color })
vim.api.nvim_set_hl(0, "Function",                  { fg = function_color })
vim.api.nvim_set_hl(0, "PreProc",                   { fg = preproc_color })
vim.api.nvim_set_hl(0, "Statement",                 { fg = statement_color })
vim.api.nvim_set_hl(0, "Operator",                  {})
vim.api.nvim_set_hl(0, "Comment",                   { fg = comment_color })
vim.api.nvim_set_hl(0, "CursorLine",                { bg = cursor_background_color })
vim.api.nvim_set_hl(0, "@lsp.type.enumMember",      { fg = enum_member_color })
vim.api.nvim_set_hl(0, "NonText",                   { fg = cerise})
vim.api.nvim_set_hl(0, "@punctuation.bracket.cpp",  { fg = normal_color})
vim.api.nvim_set_hl(0, "@punctuation.delimiter.cpp",{ fg = normal_color})
vim.api.nvim_set_hl(0, "@lsp.type.parameter.cpp",   { fg = normal_color })

vim.api.nvim_set_hl(0, '@lsp.type.comment.cpp', {})
vim.api.nvim_set_hl(0, '@constructor.cpp', {})
vim.api.nvim_set_hl(0, "@number.cpp", {})
vim.api.nvim_set_hl(0, "@keyword.repeat.cpp",       {})
vim.api.nvim_set_hl(0, "@keyword.conditional.cpp",  {})

vim.diagnostic.disable()