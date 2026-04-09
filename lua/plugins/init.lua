local gh = function(x)
  return 'https://github.com/' .. x
end

vim.pack.add({
  { src = gh 'catppuccin/nvim', name = 'catppuccin' },
  { src = gh 'nvim-mini/mini.icons', name = 'mini.icons' },
  { src = gh 'folke/snacks.nvim', name = 'snacks' },
  { src = gh 'nvim-treesitter/nvim-treesitter', name = 'nvim-treesitter' },
  { src = gh 'nvim-treesitter/nvim-treesitter-textobjects', name = 'nvim-treesitter-textobjects' },
  { src = gh 'j-hui/fidget.nvim', name = 'fidget' },
  { src = gh 'mrjones2014/codesettings.nvim', name = 'codesettings' },
}, {
  confirm = false,
})

package.preload['nvim-web-devicons'] = function()
  require('mini.icons').mock_nvim_web_devicons()
  return package.loaded['nvim-web-devicons']
end

-- Disable entire built-in ftplugin mappings to avoid conflicts.
-- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
vim.g.no_plugin_maps = true

require 'plugins/colorscheme'
require 'plugins/mini-icons'
require 'plugins/snacks'
require 'plugins/treesitter'
require 'plugins/treesitter-textobjects'
require 'plugins/fidget'
require 'plugins/codesettings'
require 'plugins/lsp'
