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
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      integrations = {
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { 'undercurl' },
            hints = { 'undercurl' },
            warnings = { 'undercurl' },
            information = { 'undercurl' },
          },
        },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)

      -- Load the colorscheme here
      vim.cmd.colorscheme 'catppuccin-mocha'

      -- You can configure highlights by doing something like
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

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
      restricted_keys = {
        ['h'] = {},
        ['j'] = {},
        ['k'] = {},
        ['l'] = {},
      },
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
