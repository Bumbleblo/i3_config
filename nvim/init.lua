-- vim.cmd('source ~/.vimrc')


-- load plugins
vim.cmd('source ~/.config/nvim/plugins.vim')

-- load style
require('style')

-- global options
require('options')


-- lsp config
require('lsp-config')

-- mappings
require('mappings')

