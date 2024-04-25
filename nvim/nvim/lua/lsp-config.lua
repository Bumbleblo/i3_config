local opts = { noremap=true, silent=false }

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)


-- autocomplete
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-Space>'] = cmp.mapping.complete {}
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }
    }

})

local nvimCapabilities = vim.lsp.protocol.make_client_capabilities()
local cmpCapabilities = require('cmp_nvim_lsp').default_capabilities()

local capabilities = vim.tbl_deep_extend('force', nvimCapabilities, require('cmp_nvim_lsp').default_capabilities())

-- lsp configuration
local lspconfig = require('lspconfig')
local default_config_servers = {
    'graphql',
    'tsserver',
    'bashls',
    'lua_ls',
    'jsonls',
    'ccls',
    'rust_analyzer',
    'pylsp',
}

lspconfig['omnisharp'].setup{
    capabilities = capabilities,
    cmd = { "dotnet",  "/home/borges/libs/omnisharp/OmniSharp.dll" }
}

-- TODO ipairs don't seems right
for _, lsp_server in ipairs(default_config_servers) do
    lspconfig[lsp_server].setup{
        capabilities = capabilities
    }
end


-- based on https://github.com/nvim-lua/kickstart.nvim
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('borges-lsp-settings', { clear = true }),
  callback = function(event)

    local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    local telescope = require('telescope.builtin')

    map('gd', telescope.lsp_definitions, '[G]oto [D]efinitions')
    map('gi', telescope.lsp_implementations, '[G]oto [I]mplementation')
    map('gr', telescope.lsp_references, '[G]oto [R]eferences')
    map('gT', telescope.lsp_type_definitions, '[G]oto [T]ype')

  end,
})
