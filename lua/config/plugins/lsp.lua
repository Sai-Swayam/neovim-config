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
        ensure_installed = { "lua_ls", "ts_ls", "jdtls", "clangd", "gopls", "powershell_es", }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "saghen/blink.cmp",
      },
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
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.ts_ls.setup({})
      lspconfig.jdtls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.gopls.setup({})
      lspconfig.powershell_es.setup({
        filetypes = { "ps1", "psm1", "psd1" },
        bundle_path = "~/AppData/Local/nvim-data/mason/packages/powershell-editor-services",
        settings = { powershell = { codeFormatting = { Preset = 'OTBS' } } },
        init_options = {
          enableProfileLoading = false,
        },
      })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      -- vim.keymap.set('n', '<space>f', vim.lsp.buf.format, {})
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {})
      vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>',
        { noremap = true, silent = true })
    end,
  }
}
