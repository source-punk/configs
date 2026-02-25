return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	opts = function()
		return {
			automatic_enable = {
				exclude = {
					"rust_analyzer",
				},
			},
		}
	end,
}
