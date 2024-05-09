return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  event = 'VeryLazy',
  dependencies = { 'plenary', 'telescope' },
  config = function()
    local harpoon = require('harpoon').setup()

    vim.keymap.set('n', '<leader>hh', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Open harpoon window' })

    vim.keymap.set('n', '<leader>hn', function()
      harpoon:list():add()
    end, { desc = 'Add current file to harpoon' })

    -- This keymaps are based on ColemakDH
    -- It uses the last row on the right side of the keyboard
    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():select(1)
    end, { desc = 'Go to harpoon item 1' })
    vim.keymap.set('n', '<leader>hr', function()
      harpoon:list():select(2)
    end, { desc = 'Go to harpoon item 2' })
    vim.keymap.set('n', '<leader>hs', function()
      harpoon:list():select(3)
    end, { desc = 'Go to harpoon item 3' })
    vim.keymap.set('n', '<leader>ht', function()
      harpoon:list():select(4)
    end, { desc = 'Go to harpoon item 4' })

    -- Toggle previous & next buffers stored within Harpoon list
    -- The keys are based on the homerow of ColemakDH
    vim.keymap.set('n', '<C-N>', function()
      harpoon:list():prev()
    end, { desc = 'Previous harpoon entry' })
    vim.keymap.set('n', '<C-I>', function()
      harpoon:list():next()
    end, { desc = 'Next harpoon entry' })
  end,
}
