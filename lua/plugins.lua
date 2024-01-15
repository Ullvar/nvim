return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use "nvim-lua/plenary.nvim"

	use { 'neoclide/coc.nvim', branch = 'release' }

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use 'nvim-telescope/telescope-ui-select.nvim'

	use 'nvim-telescope/telescope.nvim'

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use 'lewis6991/gitsigns.nvim'

	use 'ThePrimeagen/harpoon'

	use 'github/copilot.vim'

	use 'folke/tokyonight.nvim'

	use 'nvim-tree/nvim-web-devicons'

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},
	}

	use { 'anuvyklack/pretty-fold.nvim',
		config = function()
			require('pretty-fold').setup()
		end
	}

	use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

	use 'tpope/vim-dadbod'

	use 'kristijanhusak/vim-dadbod-ui'
end)
