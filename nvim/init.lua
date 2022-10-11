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

local configs = require('lspconfig.configs')

local jsgroup = vim.api.nvim_create_augroup('JSgroup', { clear = true })

vim.api.nvim_create_autocmd(
    'FileType',
    {
        pattern = { 'javascript' },
        callback = function()
                
            vim.schedule(function()
                vim.opt.shiftwidth=2
                vim.opt.tabstop=2
            end)
        end,
    }
)

configs.custom.setup{}
