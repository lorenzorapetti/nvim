return {
  'supermaven-inc/supermaven-nvim',
  config = function()
    require('supermaven-nvim').setup {}

    local api = require 'supermaven-nvim.api'

    vim.keymap.set('n', '<leader>us', function()
      api.toggle()
    end, { desc = 'Toggle Supermaven' })
  end,
}
