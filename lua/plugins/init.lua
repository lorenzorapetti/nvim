local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
  { src = gh('catppuccin/nvim'), name = "catppuccin" },
  { src = gh('nvim-mini/mini.icons'), name = "mini.icons" },
  { src = gh('folke/snacks.nvim'), name = "snacks" },
  { src = gh('nvim-treesitter/nvim-treesitter'), name = "nvim-treesitter" }
}, {
  confirm = false
})

package.preload['nvim-web-devicons'] = function()
  require('mini.icons').mock_nvim_web_devicons()
  return package.loaded['nvim-web-devicons']
end

require 'plugins/colorscheme'
require 'plugins/mini-icons'
require 'plugins/snacks'
require 'plugins/treesitter'
