return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
        theme = 'catppuccin',
        icons_enabled = true,
    },
    inactive_sections = {
        lualine_a = {'filename'},
        lualine_b = {''},
        lualine_c = {''},
        lualine_x = {'progress'},
        lualine_y = {''},
        lualine_z = {'location'}
    },
}
