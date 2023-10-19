call plug#begin('~/.config/nvim/plugins')

Plug 'preservim/nerdtree'
"Plug 'junegunn/fzf'
"Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'neovim/nvim-lspconfig'
Plug 'gruvbox-community/gruvbox'
Plug 'mfussenegger/nvim-dap'
"Plug 'vim-airline/vim-airline'
"Plug 'editorconfig/editorconfig-vim'

" cmp config 
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp' 
Plug 'saadparwaiz1/cmp_luasnip' 
Plug 'L3MON4D3/LuaSnip'

"Plug 'dense-analysis/ale'
"Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-fugitive'
call plug#end()
