-- Taken from https://github.com/MunsMan/kitty-navigator.nvim/blob/main/lua/kitty-navigator/init.lua

---@class Options
---@field keybindings Keybindings | nil

---@class Keybindings
---@field left string
---@field right string
---@field up string
---@field down string

local M = {}

local mappings = { h = 'left', j = 'bottom', k = 'top', l = 'right' }

function M.navigate(direction)
  local left_win = vim.fn.winnr('1' .. direction)
  if vim.fn.winnr() ~= left_win then
    vim.api.nvim_command('wincmd ' .. direction)
  else
    -- TODO: Support other terminals
    local command = 'kitty @ kitten navigate_kitty.py ' .. mappings[direction]
    vim.fn.system(command)
  end
end

function M.navigateLeft()
  M.navigate 'h'
end

function M.navigateRight()
  M.navigate 'l'
end

function M.navigateUp()
  M.navigate 'k'
end

function M.navigateDown()
  M.navigate 'j'
end

---@param options Options
function M.setup(options)
  local keybindings = options.keybindings or {}

  vim.keymap.set('n', keybindings.left or '<C-h>', M.navigateLeft, { silent = true })
  vim.keymap.set('n', keybindings.right or '<C-l>', M.navigateRight, { silent = true })
  vim.keymap.set('n', keybindings.up or '<C-k>', M.navigateUp, { silent = true })
  vim.keymap.set('n', keybindings.down or '<C-j>', M.navigateDown, { silent = true })
end

vim.api.nvim_create_user_command('NavigateLeft', M.navigateLeft, {})
vim.api.nvim_create_user_command('NavigateRight', M.navigateRight, {})

return M
