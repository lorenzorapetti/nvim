local gh = function(x)
  return 'https://github.com/' .. x
end

vim.g.lualine_laststatus = vim.o.laststatus
if vim.fn.argc(-1) > 0 then
  -- set an empty statusline till lualine loads
  vim.o.statusline = ' '
else
  -- hide the statusline on the starter page
  vim.o.laststatus = 0
end

vim.pack.add({
  { src = gh 'catppuccin/nvim', name = 'catppuccin' },
  { src = gh 'nvim-lua/plenary.nvim', name = 'plenary' },
  { src = gh 'nvim-mini/mini.icons', name = 'mini.icons' },
  { src = gh 'folke/which-key.nvim', name = 'which-key' },
  { src = gh 'folke/snacks.nvim', name = 'snacks' },
  { src = gh 'nvim-treesitter/nvim-treesitter', name = 'nvim-treesitter' },
  { src = gh 'nvim-treesitter/nvim-treesitter-textobjects', name = 'nvim-treesitter-textobjects' },
  { src = gh 'dmtrKovalenko/fff.nvim', name = 'fff.nvim' },
  { src = gh 'nvim-lualine/lualine.nvim', name = 'lualine' },
  { src = gh 'saghen/blink.lib', name = 'blink.lib' },
  { src = gh 'saghen/blink.cmp', name = 'blink.cmp' },
  { src = gh 'xzbdmw/colorful-menu.nvim', name = 'colorful-menu' },
  { src = gh 'j-hui/fidget.nvim', name = 'fidget' },
  { src = gh 'mrjones2014/codesettings.nvim', name = 'codesettings' },
  { src = gh 'stevearc/conform.nvim', name = 'conform' },
  { src = gh 'mrcjkb/rustaceanvim', name = 'rustaceanvim' },
  { src = gh 'saecki/crates.nvim', name = 'crates' },
  { src = gh 'nvim-mini/mini.ai', name = 'mini.ai' },
  { src = gh 'nvim-mini/mini.pairs', name = 'mini.pairs' },
  { src = gh 'nvim-mini/mini.surround', name = 'mini.surround' },
  { src = gh 'folke/trouble.nvim', name = 'trouble' },
  { src = gh 'lewis6991/gitsigns.nvim', name = 'gitsigns' },
  { src = gh 'folke/flash.nvim', name = 'flash' },
  { src = gh 'MagicDuck/grug-far.nvim', name = 'grug-far' },
  { src = gh 'rachartier/tiny-cmdline.nvim', name = 'tiny-cmdline' },
  { src = gh 'theprimeagen/harpoon', name = 'harpoon', version = 'harpoon2' },
  { src = gh 'folke/persistence.nvim', name = 'persistence' },
  { src = gh 'MeanderingProgrammer/render-markdown.nvim', name = 'render-markdown' },
  { src = gh 'folke/todo-comments.nvim', name = 'todo-comments' },
  { src = gh 'folke/ts-comments.nvim', name = 'ts-comments' },
  { src = gh 'stevearc/overseer.nvim', name = 'overseer' },
  { src = gh 'stevearc/oil.nvim', name = 'oil' },
  { src = gh 'zbirenbaum/copilot.lua', name = 'copilot' },
  { src = gh 'folke/sidekick.nvim', name = 'sidekick' },
  { src = gh 'bennypowers/splitjoin.nvim', name = 'splitjoin' },
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
require 'plugins/fff'
require 'plugins/lualine'
require 'plugins/blink'
require 'plugins/fidget'
require 'plugins/codesettings'
require 'plugins/lsp'
require 'plugins/conform'
require 'plugins/rustaceanvim'
require 'plugins/crates'
require 'plugins/mini-ai'
require 'plugins/mini-pairs'
require 'plugins/mini-surround'
require 'plugins/trouble'
require 'plugins/gitsigns'
require 'plugins/flash'
require 'plugins/grug-far'
require 'plugins/tiny-cmdline'
require 'plugins/harpoon'
require 'plugins/persistence'
require 'plugins/render-markdown'
require 'plugins/todo-comments'
require 'plugins/ts-comments'
require 'plugins/overseer'
require 'plugins/oil'
require 'plugins/copilot'
require 'plugins/sidekick'
require 'plugins/splitjoin'
require 'plugins/which-key'

vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#1E1E2E', fg = '#89B4FA', force = true })
vim.api.nvim_set_hl(0, 'PopupNormal', { bg = '#1E1E2E' })
vim.api.nvim_set_hl(0, 'SnacksPickerBorder', { bg = '#181825', fg = '#89B4FA', force = true })
