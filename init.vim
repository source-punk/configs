syntax on
set t_Co=256
set nocompatible
set cursorline
set relativenumber
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set undofile
set incsearch
set signcolumn=yes

let mapleader = " "

call plug#begin(stdpath('data') . '/plugged')

Plug 'glepnir/dashboard-nvim'
Plug 'shaunsingh/nord.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-sleuth'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

set termguicolors
let g:nord_contrast = v:true
let g:nord_cursorline_transparent = v:true
let g:nord_disable_background = v:true

" IndentLine {{
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_color_term = 0
let g:indentLine_bgcolor_term = "NONE"
let g:indentLine_color_gui = '#3b4252'
let g:indentLine_bgcolor_gui = "NONE"
let g:indentLine_fileTypeExclude = ['dashboard']
" }}

" Dashboard {{

let g:mapleader="\<Space>"
let g:dashboard_default_executive ='telescope'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

" }}

autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']

let NERDTreeMinimalUI=1
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeGitStatusWithFlags = 1

nnoremap <esc> :noh<return><esc>

let g:rg_command = 'rg --vimgrep -S'

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({hidden = true, file_ignore_patterns = { ".git/", "vendor/" }})<cr>
nnoremap <leader>fa <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let NERDTreeShowHidden=1

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:netrw_browse_split = 2
let g:netrw_banner = 0

colorscheme nord
" highlight Normal guibg=#242933
" highlight StatusLine guibg=#2E3440
" highlight SignColumn guibg=#242933

" Begin Golang Syntax Config
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_auto_type_info =1
let g:go_fmt_autosave = 1
let g:go_mod_fmt_autosave = 1
let g:go_gopls_enabled = 1
" End Golang config

" GitGutter config
let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '│'
let g:gitgutter_sign_removed_first_line = '│'
let g:gitgutter_sign_removed_above_and_below = '│'
let g:gitgutter_sign_modified_removed = '│'
" End GitGutter config

lua << END
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

require'nvim-treesitter.configs'.setup{
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

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
}
END
