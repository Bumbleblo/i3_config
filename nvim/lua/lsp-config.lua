local opts = { noremap=true, silent=false }

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)


-- improved capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- lsp configuration
local lspconfig = require('lspconfig')
local default_config_servers = {
    'graphql',
    'tsserver',
    'bashls',
    'lua_ls',
    'ccls',
    'rust_analyzer',
    'pylsp',
}

lspconfig['omnisharp'].setup{
    capabilities = capabilities,
    cmd = { "dotnet", "/home/felipe/Downloads/omnishap/OmniSharp.dll" },
    enable_editorconfig_support = true,
    enable_ms_build_load_projects_on_demand = true,
    enable_roslyn_analyzers = false,
    organize_imports_on_format = true,
    analyze_open_documents_only = false,
    enable_package_restore = true
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

  end,
})
