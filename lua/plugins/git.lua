return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>gp',
        ':Gitsigns preview_hunk<CR>',
        { desc = 'Show hunk change' },
      },
      {
        '<leader>gb',
        ':Gitsigns toggle_current_line_blame<CR>',
        { desc = 'Toggle Blame' },
      },
    },
    config = function()
      local gs = require 'gitsigns'

      gs.setup {
        on_attach = function(bufnr)
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']h', function()
            if vim.wo.diff then
              vim.cmd.normal { ']c', bang = true }
            else
              gs.nav_hunk 'next'
            end
          end)

          map('n', '[h', function()
            if vim.wo.diff then
              vim.cmd.normal { '[c', bang = true }
            else
              gs.nav_hunk 'prev'
            end
          end)
        end,
      }
    end,
  },
  {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>ga',
        function()
          vim.cmd.Git 'add .'
          vim.notify('Files added to git', 'info', { title = 'Fugitive' })
        end,
        { desc = '[G]it [A]dd' },
      },
      {
        '<leader>gc',
        function()
          vim.cmd.Git 'commit'
        end,
        { desc = '[G]it [C]ommit' },
      },
      {
        '<leader>gP',
        function()
          vim.cmd.Git 'push'
        end,
        { desc = '[G]it [P]ush' },
      },
    },
  },
}
