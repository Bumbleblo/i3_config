
local opts = { noremap=true, silent=true } 

local on_attach = function(client, buffer)

    -- TODO Maybe use a shallow copy and or a hierachical table
    local bufferOpts = { noremap=true, silent=true, buffer=buffer } 

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufferOpts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufferOpts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufferOpts)
    
end 

require('lspconfig')['csharp_ls'].setup{ 
    on_attach = on_attach
}

require('lspconfig')['graphql'].setup{
    on_attach = on_attach,
    filetypes = { "graphql", "gql" }
}

require('lspconfig')['tsserver'].setup{
    on_attach = on_attach
}
