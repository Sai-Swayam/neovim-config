return {
  -- enabled = false,
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        go = { "goimports", "gofmt" },
        c = { 'clang_format' },
        javascript = { "prettierd", "prettier", stop_after_first = true },
      },
      formatters = {
        clang_format = {
          prepend_args = { '--style=file', '--fallback-style=GNU' },
        },
        shfmt = {
          prepend_args = { '-i', '4' },
        },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500
      }
    })

    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500
      })
    end, { desc = "format file or range (in visual mode)" })
  end,
}
