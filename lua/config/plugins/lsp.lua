return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "clangd", "html", "cssls", "css_variables",
          "cssmodules_ls", "tailwindcss", "eslint", },
        automatic_enable = {
          -- needs external plugin
          exclude = { 'jdtls' }
        }
      })
    end
  },
  {
    "mfussenegger/nvim-jdtls",
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        float = {
          border = "rounded",
        },
      },
    },
    dependencies = {
      -- {
      --   "saghen/blink.cmp",
      -- },
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },

    config = function()
      --------------------------------------------------------------------------------------------------------------
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities())

      local servers = {
        lua_ls = {},
        -- jdtls = {},
        clangd = {},
        -- gopls = {},
        html = {},
        cssls = {},
        css_variables = {},
        cssmodules_ls = {},
        eslint = {},
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        ts_ls = {},
        -- powershell_es = {
        --   filetypes = { "ps1", "psm1", "psd1" },
        --   bundle_path = "~/AppData/Local/nvim-data/mason/packages/powershell-editor-services",
        --   settings = { powershell = { codeFormatting = { Preset = 'OTBS' } } },
        --   init_options = {
        --     enableProfileLoading = false,
        --   }
        -- },
      }

      for server, cfg in pairs(servers) do
        -- For each LSP server (cfg), we merge:
        -- 1. A fresh empty table (to avoid mutating capabilities globally)
        -- 2. Your capabilities object with Neovim + cmp features
        -- 3. Any server-specific cfg.capabilities if defined in `servers`
        cfg.capabilities = vim.tbl_deep_extend('force', {}, capabilities, cfg.capabilities or {})

        vim.lsp.config(server, cfg)
        vim.lsp.enable(server)
      end
      --------------------------------------------------------------------------------------------------------------

      -- formatting: check formatting.lua
      -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'K', function()
        vim.lsp.buf.hover {
          border = "solid",
          max_height = 20,
          max_width = 130,
          close_events = { "CursorMoved", "BufLeave", "WinLeave", "LSPDetach" },
        }
      end, { desc = "LSP hover with custom window" })

      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {})
      vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>',
        { noremap = true, silent = true })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local c = vim.lsp.get_client_by_id(args.data.client_id)
          if not c then return end

          if vim.bo.filetype == "lua" then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
              end,
            })
          end
        end,
      })

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'java',
        callback = function(args)
          require 'jdtls.jdtls_setup'.setup()
        end
      })
    end,
  }
}
