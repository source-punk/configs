---@diagnostic disable: undefined-global
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.opt.syntax = "on"
vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.errorbells = false
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 10
vim.opt.smartindent = true
vim.opt.nu = true
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.signcolumn = "yes"
vim.opt.laststatus = 3
vim.diagnostic.config({
    underline = false,
})

vim.opt.completeopt = "menu,menuone,noselect"

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- treesitter
vim.filetype.add({ extension = { wgsl = "wgsl" } })

-- oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- indentline
vim.g.indentLine_char = "│"
vim.g.indentLine_first_char = "│"
vim.g.indentLine_showFirstIndentLevel = 1
vim.g.indentLine_color_term = 0
vim.g.indentLine_bgcolor_term = "NONE"
vim.g.indentLine_bgcolor_gui = "NONE"

-- rustaceanvim
vim.g.rustaceanvim = {
	-- Plugin configuration
	tools = {},
	-- LSP configuration
	server = {
		on_attach = function(client, bufnr)
			-- you can also put keymaps in here
		end,
		default_settings = {
			-- rust-analyzer language server configuration
			["rust-analyzer"] = {
				diagnostics = {
					disabled = { "inactive-code" },
				},
			},
		},
	},
	-- DAP configuration
	dap = {},
}
