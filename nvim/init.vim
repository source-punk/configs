syntax on
set nocompatible
set showcmd
set cursorline
set relativenumber
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set scrolloff=10
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set undofile
set incsearch
set signcolumn=yes
set laststatus=3

" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END

let mapleader = " "

call plug#begin(stdpath('data') . '/plugged')

" Plug 'sbdchd/neoformat'
Plug 'windwp/nvim-autopairs'
Plug 'onsails/lspkind-nvim'
Plug 'shaunsingh/nord.nvim'
Plug 'shaunsingh/solarized.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tpope/vim-sleuth'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'tami5/lspsaga.nvim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-ts-autotag'

call plug#end()

set completeopt=menu,menuone,noselect

set termguicolors

let g:nord_contrast = v:true
let g:nord_cursorline_transparent = v:true
let g:nord_disable_background = v:true
let g:nord_uniform_diff_background = v:true

let g:solarized_italic_comments = v:true
let g:solarized_italic_keywords = v:true
let g:solarized_italic_functions = v:true
let g:solarized_italic_variables = v:false
let g:solarized_contrast = v:false
let g:solarized_borders = v:true
let g:solarized_disable_background = v:false

" IndentLine {{
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_color_term = 0
let g:indentLine_bgcolor_term = "NONE"
let g:indentLine_color_gui = '#3b4252'
let g:indentLine_bgcolor_gui = "NONE"
" }}

nnoremap <esc> :noh<return><esc>

let g:rg_command = 'rg --vimgrep -S'

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({hidden = true, file_ignore_patterns = { ".git/", "vendor/" }})<cr>
nnoremap <leader>fa <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').lsp_references()<cr>

nnoremap <leader>n :NvimTreeToggle<CR>
nnoremap <leader>t :NvimTreeFocus<CR>
nnoremap <C-f> :NvimTreeFindFile<CR>


if executable('rg')
    let g:rg_derive_root='true'
endif

let g:netrw_browse_split = 2
let g:netrw_banner = 0

colorscheme nord
" colorscheme solarized

hi Pmenu guibg=#2E3440
hi PmenuSbar guibg=#2E3440

" GitGutter config
let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '│'
let g:gitgutter_sign_removed_first_line = '│'
let g:gitgutter_sign_removed_above_and_below = '│'
let g:gitgutter_sign_modified_removed = '│'
" End GitGutter config

" >> Lsp key bindings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K     <cmd>Lspsaga hover_doc<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-p> <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <C-n> <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gn    <cmd>Lspsaga rename<CR>
nnoremap <silent> ga    <cmd>Lspsaga code_action<CR>
xnoremap <silent> ga    <cmd>Lspsaga range_code_action<CR>
nnoremap <silent> gs    <cmd>Lspsaga signature_help<CR>

lua << END
require("mason").setup {}
require("mason-lspconfig").setup {}
require('nvim-autopairs').setup {}

require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

require("nvim-tree").setup{
  view = {
    adaptive_size = true
  },
  renderer = {
    highlight_git = true,
  },
}

require('lualine').setup{
    options = {
        theme = 'nord'
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


-- treesitter config
require'nvim-treesitter.configs'.setup{
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "all",
  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- List of parsers to ignore installing
  ignore_install = {},
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- list of language that will be disabled
    disable = {},
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
  },
}
require('nvim-ts-autotag').setup()

-- cmp config
local cmp = require'cmp'
local lspkind = require('lspkind')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  view = {
    entries = 'custom'
  },
  formatting = {
    format = lspkind.cmp_format({
    })
  },
  experimental = {
    ghost_text = true,
  }
})
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Enable the following language servers
local servers = { 'dockerls', 'gopls', 'tsserver', 'sumneko_lua', 'cssls', 'html', 'yamlls', 'vimls', 'tflint', 'terraformls' }
for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
  }
end

require('lspconfig')['pylsp'].setup {
  capabilities = capabilities,
  settings = {
    pylsp = {
      configurationSources = { 'flake8' },
      plugins = {
        flake8 = { enabled = true, ignore = { 'E501' } },
        pylint = { enabled = false, ignore = { 'E501' } },
        pycodestyle = { enabled = false, ignore = { 'E501' } },
        pyflakes = { enabled = false, ignore = { 'E501' } },
        mccabe = { enabled = false, ignore = { 'E501' } },
      }
    }
  },
}

-- lspsaga config
local saga = require 'lspsaga'
saga.init_lsp_saga()

vim.opt.fillchars = {
  horiz     = '━',
  horizup   = '┻',
  horizdown = '┳',
  vert      = '┃',
  vertleft  = '┫',
  vertright = '┣',
  verthoriz = '╋',
}

END

