

local options = { noremap = true }
local map = vim.api.nvim_set_keymap


map('n', '<C-f>', ':Files<cr>', options)
