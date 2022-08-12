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

require("nvim-tree").setup()
    
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
--
--nvim super collider
local scnvim = require 'scnvim'
local map = scnvim.map
local map_expr = scnvim.map_expr
scnvim.setup {
  keymaps = {
    ['<M-e>'] = map('editor.send_line', {'i', 'n'}),
    ['<C-e>'] = {
      map('editor.send_block', {'i', 'n'}),
      map('editor.send_selection', 'x'),
    },
    ['<CR>'] = map('postwin.toggle'),
    ['<M-CR>'] = map('postwin.toggle', 'i'),
    ['<M-L>'] = map('postwin.clear', {'n', 'i'}),
    ['<C-k>'] = map('signature.show', {'n', 'i'}),
    ['<F12>'] = map('sclang.hard_stop', {'n', 'x', 'i'}),
    ['<leader>st'] = map('sclang.start'),
    ['<leader>sk'] = map('sclang.recompile'),
    ['<F1>'] = map_expr('s.boot'),
    ['<F2>'] = map_expr('s.meter'),
  },
  editor = {
    highlight = {
      color = 'IncSearch',
    },
  },
  postwin = {
    float = {
      enabled = true,
    },
  },
}
