return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	opts = function()
		-- vim.lsp.config("rust_analyzer", {
		-- 	settings = {
		-- 		["rust-analyzer"] = {
		-- 			diagnostics = {
		-- 				disabled = { "inactive-code" },
		-- 			},
		-- 		},
		-- 	},
		-- })
		return {
			automatic_enable = {
				exclude = {
					"rust_analyzer",
				},
			},
		}
	end,
}
