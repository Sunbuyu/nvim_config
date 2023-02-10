require('lsp.masson_config')
-- require('lsp.cmp_config')


-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local lspconfig = require("lspconfig")
local function on_attach(client, bufnr) -- set up buffer keymaps, etc.
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

local lsp_flags = {
  debounce_text_changes = 150,
}

-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'fortls', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'luasnip'},
    { name = 'buffer'},
    { name = 'path'},
  },
}

-- after local capabilities = ....
-- start server
lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {"vim", "packer_bootstrap"},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "on",
            }
        }
  },
}

require('lspconfig')['clangd'].setup{
    on_attach = on_attach('clangd'),
    flags = lsp_flags,
    capabilities = capabilities,
    -- Server-specific settings...
    settings = {
      ["clangd"] = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "on",
            },
        }
    }
}


lspconfig.fortls.setup{
    on_attach = on_attach('fortls'),
    flags = lsp_flags,
    capabilities = capabilities,
    -- Server-specific settings...
    cmd = {
        'fortls',
        '--lowercase_intrisics',
        '--hover_signature',
        '--hover_language=fortran',
        '--use_signature_help'
        },
    settings = {
      ["fortls"] = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "on",
            },
            filetype = { "fortran","F90","f90","FI" },
            -- root_dir = [[root_pattern(".fortls")]];
            -- settings = {
            --     nthreads = 1,
            --     incremental_sync = true,
            --     -- "lowercase_intrinsics": true,
            --     hover_signature  = true,
            --     -- "use_signature_help": true,
            --     -- "excl_paths": ["tests/**", "tools/**"],
            --     -- "excl_suffixes": ["_skip.f90"],
            --     -- "include_dirs": ["include/**"],
            --     -- "pp_suffixes": [".F90", ".h"],
            --     -- "pp_defs": { "HAVE_HDF5": "", "MPI_Comm": "integer" },
            -- };
      };
    };
};

