return {
    'MeanderingProgrammer/render-markdown.nvim',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	lazy = false,

    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
		overrides = {
			buflisted = {},
			buftype = {
				nofile = {
					render_modes = false,
					padding = { highlight = 'NormalFloat' },
					sign = { enabled = false },
					code = { left_pad = 0, right_pad = 0 },
				},
			},
			filetype = {},
		},
	},
}
