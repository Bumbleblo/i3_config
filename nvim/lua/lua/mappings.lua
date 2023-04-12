local options = { noremap = true }

local map = vim.api.nvim_set_keymap

-- FZF
map('n', '<C-f>', ':Files<cr>', options)
map('n', '<C-g>', ':Ag<cr>', options)


-- NERDTree
map('n', '<C-p>', ':NERDTreeToggle<cr>', options)
