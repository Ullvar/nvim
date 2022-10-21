return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use "nvim-lua/plenary.nvim"
  use {'neoclide/coc.nvim', branch = 'release'}
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
}
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

  use {
   'lewis6991/gitsigns.nvim'
  }

  use 'ThePrimeagen/harpoon'



  use 'folke/tokyonight.nvim'

  -- Debugging
  use 'mfussenegger/nvim-dap'
  use "rcarriga/nvim-dap-ui"
  use 'theHamsta/nvim-dap-virtual-text'
  use 'mfussenegger/nvim-dap-python'
end)

