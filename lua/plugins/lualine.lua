return {
  'nvim-lualine/lualine.nvim',
  name = 'lualine',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
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
  opts = {
    options = {
      section_separators = '',
      component_separators = '',
      globalstatus = true,
      disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'starter' } },
    },
    extensions = { 'neo-tree', 'lazy' },
    sections = {
      lualine_x = { '%=', 'harpoon2' },
    },
  },
}
