
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
    ['<C-x>'] = cmp.mapping.scroll_docs(4),
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

local lspconfig = require("lspconfig")
-- after local capabilities = ....
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
    settings = {
      ["fortls"] = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "on",
            },
            cmd={ "fortls" },
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

