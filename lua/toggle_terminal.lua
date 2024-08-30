-- ~/.config/nvim/lua/terminal.lua

local M = {}

function M.ToggleTerminal()
  local term_buf = nil
  -- Check if a terminal is already open
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == 'terminal' then
      term_buf = buf
      break
    end
  end

  if term_buf then
    -- If terminal is open, close it
    vim.cmd('bdelete! '..term_buf)
  else
    -- If no terminal is open, open it at the bottom
    vim.cmd('botright split | resize 10 | terminal')
  end
end

function M.ResizeTerminal()
  -- Ensure the terminal window is resized to 10 lines
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == 'terminal' then
      vim.cmd('resize 10')
      break
    end
  end
end

return M

