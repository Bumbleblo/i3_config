local opts = { noremap=true, silent=true } 

local on_attach = function(client, buffer)

    vim.api.nvim_buf_set_option(buffer, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- TODO Maybe use a shallow copy and or a hierachical table
    local bufferOpts = { noremap=true, silent=true, buffer=buffer } 

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufferOpts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufferOpts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufferOpts)
    
end 

-- improved capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- lsp configuration
local lspconfig = require('lspconfig')

local default_config_servers = {
    'csharp_ls',
    'graphql',
    'tsserver',
    'bashls'
} 

-- TODO ipairs don't seems right
for _, lsp_server in ipairs(default_config_servers) do 
    lspconfig[lsp_server].setup{
        on_attach = on_attach,
        capabilities = capabilities
    }
end

-- cmp config
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup{
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)    
        end
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),    
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }
    }
}
