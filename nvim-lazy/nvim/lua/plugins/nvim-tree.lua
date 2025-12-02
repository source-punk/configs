return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = true,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
	view = {
	  adaptive_size = true,
	  side = 'right',
    },
	renderer = {
	  highlight_git = true,
	},
  },
}
