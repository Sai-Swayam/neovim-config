return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  -- enabled = false,
  opts = {
    dashboard = {
      enabled = true,
      width = 18,
      preset = {
        header = [[

                                        ]],

      },
      sections = {
        -- stylua: ignore start
        { hidden = true, icon = " ", key = "t", desc = "Find [T]ext", action = ":lua Snacks.dashboard.pick('live_grep')" },
        { hidden = true, icon = " ", key = "r", desc = "[R]ecent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        { hidden = true, icon = "󰒲 ", key = "l", desc = "[L]azy", action = ":Lazy" },
        -- stylua: ignore end

        -- Header
        {
          text = " ",
          padding = 1
        },
        {
          section = "header",
          padding = 0,
        },
        {
          padding = 1,
          align = "center",
          text = {
            -- { "Neovim :: M Λ C R O ", hl = "Normal" },
            -- { "- Editing made simple", hl = "NonText" },
            { "Welcome Sai", hl = "Normal" },
            align = "center",
          },
          action = ":lua Snacks.dashboard.pick('files')",
          key = "f",
        },

        -- Keys
        {
          padding = 0,
          text = {
            -- { "  [F]ind [F]ile", width = 19, hl = "NonText" },
            -- { "  Find [T]ext", hl = "NonText" },
            { "📑 File     ", width = 19, hl = "NonText" },
            { "🔍 Text     ", hl = "NonText" },
          },
          action = ":lua Snacks.dashboard.pick('files')",
          key = "f",
        },
        {
          padding = 0,
          text = {
            { " ", width = 3 },
            -- { " [N]ew File", width = 19, hl = "NonText" },
            -- { " [R]ecent File", hl = "NonText" },
            { "📄 New     ", width = 19, hl = "NonText" },
            { "⌚ Recent     ", hl = "NonText" },
          },
          action = ":ene | startinsert",
          key = "n",
        },
        {
          padding = 1,
          text = {
            { " ", width = 10 },
            -- { "  [C]onfig", hl = "NonText" },
            { "🔧 Config", hl = "NonText" },
            { " ", width = 10 },
            -- { "󰒲  [L]azy", hl = "NonText" },
            { "💤 Lazy", hl = "NonText" },
            { " ", width = 14 },
          },
          action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          key = "c",
        },
        {
          padding = 2,
          text = {
            { " ", width = 5 },
            -- { "  [Q]uit", hl = "NonText" },
            { "❗Quit", hl = "NonText" },
          },
          action = ":quitall",
          key = "q",
        },

        --  Startup
        -- { section = "startup", padding = 1 },
        -- { section = "terminal", cmd = "printf ' '", height = 10 },

      },
      formats = {
        key = { "" },
        header = {
          align = "center",
        },
      },
    },
  }
}
