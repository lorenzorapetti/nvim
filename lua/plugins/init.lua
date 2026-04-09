local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
  { src = gh('catppuccin/nvim'), name = "catppuccin" },
  { src = gh('nvim-mini/mini.icons'), name = "mini.icons" },
  { src = gh('folke/snacks.nvim'), name = "snacks" }
}, {
  confirm = false
})

require 'plugins/colorscheme'
require 'plugins/mini-icons'
require 'plugins/snacks'
