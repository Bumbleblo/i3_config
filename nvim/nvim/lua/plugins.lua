local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end


vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ 
		'nvim-telescope/telescope.nvim',

		event = 'VimEnter',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end
		}

	},
	{
		'preservim/nerdtree',
		event = 'VimEnter',
	},
	{
		'gruvbox-community/gruvbox',
	},	
	{
		'vim-airline/vim-airline',
		event = 'VimEnter',
	},
	{
		'tpope/vim-fugitive',
		event = 'VimEnter',
	},
    {  -- Autocomplete
        'hrsh7th/nvim-cmp', 
        event = 'VimEnter',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            {
                "L3MON4D3/LuaSnip",
                -- follow latest release.
                version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
                -- install jsregexp (optional!).
                build = "make install_jsregexp"
            }
        }
    },
	{
		'neovim/nvim-lspconfig',
		event = 'VimEnter'
	}
}, 
opts)
