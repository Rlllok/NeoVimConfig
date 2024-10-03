local terminal_buffer = nil 

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    --vim.cmd("vsplit")
    --vim.api.nvim_open_win(0, false, {split = "right", vertical = true, win = 0})
  end,
})

-- Terminal
local OpenTerminal = function()
  local windows_count     = 2
  local windows           = vim.api.nvim_list_wins()
  local current_window_id = vim.api.nvim_win_get_number(0) 
  local other_window_id   = (current_window_id) % windows_count + 1
  print(current_window_id)

  if (terminal_buffer == nil) or (not vim.api.nvim_buf_is_valid(termina_buffer)) then
    vim.api.nvim_set_current_win(windows[other_window_id])
    vim.cmd("term")
    terminal_buffer = vim.api.nvim_win_get_buf(0)
  else
    vim.api.nvim_set_current_win(windows[other_window_id])
    vim.api.nvim_win_set_buf(windows[other_window_id], terminal_buffer)
  end
end

local OpenTerminalThisWindow = function()
  if terminal_buffer == nil then
    vim.api.nvim_set_current_win(0)
    vim.cmd("term")
    terminal_buffer = vim.api.nvim_win_get_buf(0)
  else
    vim.api.nvim_set_current_win(0)
    vim.api.nvim_win_set_buf(0, terminal_buffer)
  end
end

vim.keymap.set("n", "<leader>pp", OpenTerminal, {remap = "true"})
vim.keymap.set("n", "<leader>pt", OpenTerminalThisWindow, {remap = "true"})
