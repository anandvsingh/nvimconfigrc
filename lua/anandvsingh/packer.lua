---@diagnostic disable: undefined-global, lowercase-global

---@diagnostic disable: undefined-global, lowercase-global

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

vim.cmd("packadd packer.nvim")	


return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- ...

	-- My plugins here
	-- use 'foo1/bar1.nvim'
	-- use 'foo2/bar2.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'folke/noice.nvim',
		requires = { {'MunifTanjim/nui.nvim'}, {'rcarriga/nvim-notify'} }
	}

use({ 'rose-pine/neovim', as = 'rose-pine' })
	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup {
				icons = false,
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	})

	use ('nvim-treesitter/nvim-treesitter', {run = ':tsupdate'})
	use ('nvim-treesitter/playground')
	use ('ThePrimeagen/harpoon')
	use ('nvim-lua/plenary.nvim')
	use ('mbbill/undotree')
    use ('nvim-tree/nvim-tree.lua')
    use ("tpope/vim-fugitive")
    use ("stevearc/aerial.nvim")
    use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}
	use {'Eandrju/cellular-automaton.nvim'}
	
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	
end)
