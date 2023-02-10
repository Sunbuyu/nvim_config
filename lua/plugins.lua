-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Simple plugins can be specified as strings
--  use '9mm/vim-closer'

  -- onedarker pro themes
  --use 'olimorris/onedarkpro.nvim'

  -- onedarker pro themes 2
  use 'navarasu/onedark.nvim'

  -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- file explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- comment
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- diffview
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- tree-sitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

    -- bufferline
    use {
        'akinsho/bufferline.nvim', 
        tag = "v3.*", 
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- telescope
    use { 
        'nvim-telescope/telescope.nvim', 
        requires = { "nvim-lua/plenary.nvim" } 
    }


    -- dashboard
    use {'glepnir/dashboard-nvim'}


    -- project
    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            }
        end
    }

    -- coc.nvim for fortran
    -- use {'neoclide/coc.nvim', branch = 'release'}
    use ({'neoclide/coc.nvim', branch = 'release'})

    ---- LSP -------
    use({ "williamboman/mason.nvim" })
    -- Lspconfig
    use({ "williamboman/mason-lspconfig.nvim" })
    use({ "neovim/nvim-lspconfig"})

    ------ code comple ---------
    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    use("hrsh7th/vim-vsnip")
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")

end)

