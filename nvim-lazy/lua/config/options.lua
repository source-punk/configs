-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)


-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.opt.syntax=on
vim.opt.showcmd=true
vim.opt.cursorline=true
vim.g.noerrorbells=true
vim.opt.relativenumber=true
vim.g.nowrap=true
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.scrolloff=10
vim.opt.smartindent=true
vim.opt.nu=true
vim.opt.smartcase=true
vim.g.noswapfile=true
vim.opt.undofile=true
vim.opt.incsearch=true
vim.opt.signcolumn=yes
vim.opt.laststatus=3

vim.opt.completeopt='menu,menuone,noselect'


vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- indentline
vim.g.indentLine_char = '│'
vim.g.indentLine_first_char = '│'
vim.g.indentLine_showFirstIndentLevel = 1
vim.g.indentLine_color_term = 0
vim.g.indentLine_bgcolor_term = "NONE"
vim.g.indentLine_bgcolor_gui = "NONE"


