vim.g.fff = {
  lazy_sync = true,
  title = 'Files',
  prompt = ' ',
  layout = {
    prompt_position = 'top',
  },
  keymaps = {
    move_up = { '<Up>', '<C-p>', '<C-k>' },
    move_down = { '<Down>', '<C-n>', '<C-j>' },
    cycle_grep_modes = '<C-g>',
    cycle_previous_query = '<C-h>',
  },
}

Util.keymap.set('n', '<leader><space>', function()
  require('fff').find_files()
end, { desc = 'Find files' })

Util.keymap.set('n', '<leader>/', function()
  require('fff').live_grep()
end, { desc = 'Live grep' })
