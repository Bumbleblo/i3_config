vim.opt.background = 'dark'
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.fileencodings = 'utf-8'
vim.opt.number = true
vim.opt.shell='/bin/bash'
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4


vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = { "*.js", "*.yml", "*.tsx"},
    callback = function()
        vim.opt.shiftwidth=2
    end
})
