return {
  'nvim-lualine/lualine.nvim',
  name = 'lualine',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'folke/trouble.nvim',
  },
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = ' '
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  config = function()
    local function show_macro_recording()
      local recording_register = vim.fn.reg_recording()
      if recording_register == '' then
        return ''
      else
        return 'Recording @' .. recording_register
      end
    end

    local lualine = require 'lualine'
    local symbols = require('trouble').statusline {
      mode = 'symbols',
      groups = {},
      title = false,
      filter = { range = true },
      format = '{kind_icon}{symbol.name:Normal}',
    }

    lualine.setup {
      options = {
        component_separators = '',
        globalstatus = true,
        disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'starter' } },
        section_separators = { left = '', right = '' },
      },
      extensions = { 'neo-tree', 'lazy' },
      sections = {
        lualine_c = {
          'filename',
          {
            'macro-recording',
            fmt = show_macro_recording,
          },
          {
            symbols.get,
            cond = symbols.has,
          },
        },
        lualine_x = { '%=', 'harpoon2', 'filetype' },
      },
    }

    vim.api.nvim_create_autocmd('RecordingEnter', {
      callback = function()
        lualine.refresh {
          place = { 'statusline' },
        }
      end,
    })

    vim.api.nvim_create_autocmd('RecordingLeave', {
      callback = function()
        -- This is going to seem really weird!
        -- Instead of just calling refresh we need to wait a moment because of the nature of
        -- `vim.fn.reg_recording`. If we tell lualine to refresh right now it actually will
        -- still show a recording occuring because `vim.fn.reg_recording` hasn't emptied yet.
        -- So what we need to do is wait a tiny amount of time (in this instance 50 ms) to
        -- ensure `vim.fn.reg_recording` is purged before asking lualine to refresh.
        local timer = vim.loop.new_timer()

        if timer == nil then
          return
        end

        timer:start(
          50,
          0,
          vim.schedule_wrap(function()
            lualine.refresh {
              place = { 'statusline' },
            }
          end)
        )
      end,
    })
  end,
}
