-- 就是在这里先设置mason的，然后设置mason-lspconfig的，最后设置cmp 的设置就可以了。
--
-- :h mason-default-settings
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
-- mason -lspconfig 的设置可以用它自带的lspconfig完全代替nvim-lspconfig。
-- 但是还是建议就用官方的nvim-lspconfig设置细节吧。
--
require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "sumneko_lua",
    "bashls",
    "jsonls",
    "pyright",
    "rust_analyzer",
    "yamlls",
    "gopls",
    "fortls",
    "clangd",
    "cmake",
    "tsserver",
  },

  automatic_installation = true,
})

