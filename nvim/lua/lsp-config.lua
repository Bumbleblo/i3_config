local opts = { noremap=true, silent=false } 

vim.lsp.set_log_level("debug")

local on_attach = function(client, buffer)

    -- TODO Maybe use a shallow copy and or a hierachical table
    local bufferOpts = { noremap=true, silent=false, buffer=buffer } 

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
    'graphql',
    'tsserver',
    'bashls'
} 

lspconfig['omnisharp'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "dotnet", "/home/felipe/Downloads/omnishap/OmniSharp.dll" },
    enable_editorconfig_support = true,
    enable_ms_build_load_projects_on_demand = true,
    enable_roslyn_analyzers = false, 
    organize_imports_on_format = true,
    enable_import_completion = true,
    sdk_include_prereleases = true, 
    analyze_open_documents_only = true, 
    enable_package_restore = true
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
            luasnip.lsp_expand(args)    
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
