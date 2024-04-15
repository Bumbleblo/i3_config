local builtin = require('telescope.builtin')

local options = { noremap = true }

local map = vim.api.nvim_set_keymap

-- FZF
--map('n', '<C-f>', ':Files<cr>', options)
--map('n', '<C-g>', ':Ag<cr>', options)
vim.keymap.set('n', '<C-f>', builtin.find_files, options)
vim.keymap.set('n', '<C-g>', builtin.live_grep, options)


-- NERDTree
map('n', '<C-p>', ':NERDTreeToggle<cr>', options)

-- tags
map('n', 'gD', ':TagbarToggle', options)
