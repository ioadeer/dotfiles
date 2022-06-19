--[[
 ___       _ _
|_ _|_ __ (_) |_
 | || '_ \| | __|
 | || | | | | |_
|___|_| |_|_|\__|
--]]
-- guia
-- https://github.com/nanotee/nvim-lua-guide
-- This is a Neovim default but for some reason I need it or barbar doesn't work.
--vim.api.nvim_command 'filetype plugin indent on'

--require 'dump'
require 'plugins'

-- vim.api.nvim_command 'runtime init/config.vim'
-- vim.cmd 'source ~/.config/nvim/

vim.api.nvim_command 'runtime init/nvim-tree-config.vim'
    
vim.cmd [[
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=4
set guifont=Jetbrains\ Mono
]]

-- Example config in Lua
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

vim.cmd[[colorscheme tokyonight]]

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = true,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}

-- para vim script
--vim.cmd "source ~/.config/nvim/init/config.vim"

-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-- Find files using Telescope command-line sugar.
-- Using Lua functions
-- nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
-- nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
-- nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
-- nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
-- vim.api.nvim_set_keymap('n', '<Leader>w', ':write<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>Telescope find_files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fb', '<cmd>Telescope buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fh', '<cmd>Telescope help_tags<CR>', {noremap = true})

-- require '.config/nvim/lsp/lsp-keybindings'
-- require '~/.config/nvim/lsp/server-confs'
-- config language servers
-- agregar mas css, json, markdown, c++? , rust?
require'lspconfig'.pyright.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.solidity_ls.setup{}
--require'lspconfig'.solc.setup{}
