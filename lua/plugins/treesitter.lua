return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'lewis6991/gitsigns.nvim',
    },
    config = function()
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-space>',
            node_incremental = '<C-space>',
            scope_incremental = false,
            node_decremental = '<bs>',
          },
        },

        textobjects = {
          select = {
            enable = true,
            -- Automatically jump to the nearest textobject
            lookahead = true,

            keymaps = {
              ['am'] = { query = '@function.outer', desc = 'Select the outer part of the function/method' },
              ['im'] = { query = '@function.inner', desc = 'Select the inner part of the function/method' },

              ['ac'] = { query = '@class.outer', desc = 'Select the outer part of the class' },
              ['ic'] = { query = '@class.inner', desc = 'Select the inner part of the class' },

              ['ai'] = { query = '@conditional.outer', desc = 'Select the outer part of the conditional' },
              ['ii'] = { query = '@conditional.inner', desc = 'Select the inner part of the conditional' },

              ['aa'] = { query = '@parameter.outer', desc = 'Select the outer part of the arguments' },
              ['ia'] = { query = '@parameter.inner', desc = 'Select the inner part of the arguments' },

              ['al'] = { query = '@loop.outer', desc = 'Select the outer part of the loop' },
              ['il'] = { query = '@loop.inner', desc = 'Select the inner part of the loop' },
            },
          },

          swap = {
            enable = true,
            swap_next = {
              ['<leader>np'] = { query = '@parameter.inner', desc = 'Swap parameter with the next' },
              ['<leader>nm'] = { query = '@function.inner', desc = 'Swap function/method with the next' },
            },
            swap_previous = {
              ['<leader>pp'] = { query = '@parameter.inner', desc = 'Swap parameter with the previous' },
              ['<leader>pm'] = { query = '@function.inner', desc = 'Swap function/method with the previous' },
            },
          },

          move = {
            enable = true,
            -- Whether to set jumps in the jumplist so that
            -- we can time travel with <C-o> and <C-i>
            set_jumps = true,

            goto_next_start = {
              [']m'] = { query = '@function.outer', desc = 'Jump to next function' },
              [']i'] = { query = '@conditional.outer', desc = 'Jump to next conditional (if)' },
              [']l'] = { query = '@loop.outer', desc = 'Jump to next loop' },
            },

            goto_next_end = {
              [']M'] = { query = '@function.outer', desc = 'Jump to next function end' },
              [']I'] = { query = '@conditional.outer', desc = 'Jump to next conditional (if) end' },
              [']L'] = { query = '@loop.outer', desc = 'Jump to next loop end' },
            },

            goto_previous_start = {
              ['[m'] = { query = '@function.outer', desc = 'Jump to previous function' },
              ['[i'] = { query = '@conditional.outer', desc = 'Jump to previous conditional (if)' },
              ['[l'] = { query = '@loop.outer', desc = 'Jump to previous loop' },
            },

            goto_previous_end = {
              ['[M'] = { query = '@function.outer', desc = 'Jump to previous function end' },
              ['[I'] = { query = '@conditional.outer', desc = 'Jump to previous conditional (if) end' },
              ['[L'] = { query = '@loop.outer', desc = 'Jump to previous loop end' },
            },
          },

          lsp_interop = {
            enable = true,
            border = 'none',
            peek_definition_code = {
              ['<leader>df'] = { query = '@function.outer', desc = 'Peek at function definition' },
              ['<leader>dc'] = { query = '@class.outer', desc = 'Peek at class definition' },
            },
          },
        },
      }

      require('treesitter-context').setup {
        enable = true,
        trim_scope = 'inner',
        max_lines = 5,
        multiline_threshold = 1,
      }

      vim.keymap.set('n', '<leader>uc', function()
        vim.g.disable_treesitter_context = not vim.g.disable_treesitter_context
        if vim.g.disable_treesitter_context then
          vim.cmd [[TSContextDisable]]
          vim.notify('Treesitter Context Disabled', 'info', { title = 'nvim-treesitter' })
        else
          vim.cmd [[TSContextEnable]]
          vim.notify('Treesitter Context Enabled', 'info', { title = 'nvim-treesitter' })
        end
      end, { desc = 'Toggle Treesitter Context' })

      local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

      -- Repeat movement with ; and ,
      -- ensure ; goes forward and , goes backward regardless of the last direction
      vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)

      -- vim way: ; goes to the direction you were moving.
      -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
      -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f)
      vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F)
      vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t)
      vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T)

      -- example: make gitsigns.nvim movement repeatable with ; and , keys.
      local gs = require 'gitsigns'

      -- make sure forward function comes first
      local next_hunk_repeat, prev_hunk_repeat = ts_repeat_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)
      -- Or, use `make_repeatable_move` or `set_last_move` functions for more control. See the code for instructions.

      vim.keymap.set({ 'n', 'x', 'o' }, ']h', next_hunk_repeat)
      vim.keymap.set({ 'n', 'x', 'o' }, '[h', prev_hunk_repeat)
    end,
  },
  'JoosepAlviste/nvim-ts-context-commentstring',
}
