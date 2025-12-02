return {
    'nvimdev/lspsaga.nvim',
	lazy = false,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    },
	opts = {
	  symbol_in_winbar = {
		enable = false,
	  },
	  ui = {
		code_action = '',
	  },
	  hover = {
		max_width = 1,
	  },
	  saga_winblend = 0,
	},
}

