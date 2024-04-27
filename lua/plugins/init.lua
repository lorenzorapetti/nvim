-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
return {
  {
    'nvim-lua/plenary.nvim',
    name = 'plenary',
  },

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- Load the colorscheme here
      vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', dependencies = { 'plenary' }, opts = { signs = false } },

  -- Handy bracket keymaps
  {
    'tummetott/unimpaired.nvim',
    event = 'VeryLazy',
    -- This is needed
    -- because it calls require('unimpaired').setup()
    config = true,
  },

  {
    'm4xshen/hardtime.nvim',
    dependencies = { 'MunifTanjim/nui.nvim', 'plenary' },
    opts = {
      restriction_mode = 'hint',
      -- Reenable arrow keys cause i have a layer that replicates hjkl
      disabled_keys = {
        ['<Up>'] = {},
        ['<Down>'] = {},
        ['<Left>'] = {},
        ['<Right>'] = {},
      },
      disabled_filetypes = { 'qf', 'netrw', 'NvimTree', 'lazy', 'mason', 'oil', 'neo-tree' },
    },
  },
}
