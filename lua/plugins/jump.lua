require('jump').setup()

vim.keymap.set({ 'n', 'x', 'o' }, 's', require('jump').start, {})
