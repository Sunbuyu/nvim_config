vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 基础设置
require('basic')

-- plugins
require('plugins')

-- 主题
require('colorscheme')

-- nvim_tree config
require('plugin_config.nvim-tree')

-- keybindings
require('keybindings')

-- nvimComment
require('plugin_config.comment')


-- nvim treesitter
require('plugin_config.tree-sitter')

-- dashboard
require('plugin_config.dashboard')

-- project.nvim
require('plugin_config.project')

require('plugin_config.telescope')

-- LSP 
-- require('lsp')

-- coc.nvim
require('plugin_config.coc_nvim')
