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
	{
		'neovim/nvim-lspconfig',
		event = 'VimEnter',
	}
}, 
opts)
