return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config

  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'default' },

    -- appearance = {
    --   -- highlight_ns = vim.api.nvim_create_namespace('blink_cmp'),
    --   -- use_nvim_cmp_as_default = false,
    --   nerd_font_variant = 'mono',
    -- },

    appearance = {
      highlight_ns = vim.api.nvim_create_namespace('blink_cmp'),
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      use_nvim_cmp_as_default = false,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
      kind_icons = {
        Text = '󰉿',
        Method = '󰊕',
        Function = '󰊕',
        Constructor = '󰒓',

        Field = '󰜢',
        Variable = '󰆦',
        Property = '󰖷',

        Class = '󱡠',
        Interface = '󱡠',
        Struct = '󱡠',
        Module = '󰅩',

        Unit = '󰪚',
        Value = '󰦨',
        Enum = '󰦨',
        EnumMember = '󰦨',

        Keyword = '󰻾',
        Constant = '󰏿',

        Snippet = '󱄽',
        Color = '󰏘',
        File = '󰈔',
        Reference = '󰬲',
        Folder = '󰉋',
        Event = '󱐋',
        Operator = '󰪚',
        TypeParameter = '󰬛',
      },
    },

    completion = {
      -- No seleccionar por defecto, autoinsertar al seleccionar
      list = { selection = { preselect = false, auto_insert = true } },
      documentation = { auto_show = true, window = { border = nil }, auto_show_delay_ms = 50 },
      menu = {
        enabled = true,
        winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
        -- border = "rounded",
        border = nil,

        draw = {
          padding = { 0, 1 },
          width = { fill = true, min = 10 },
          -- gap = 1,
          -- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
          columns = { { "kind_icon" }, { "label" }, {"kind"} },
          components = {
            kind_icon = {
              -- ellipsis = true,
              width = { fill = false, min = 4 },

              -- text = function(ctx) return " " .. ctx.icon_gap .. ctx.kind_icon .. ctx.icon_gap end,

              text = function(ctx)
                local icon = ctx.kind_icon
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)

                  if dev_icon then
                    icon = dev_icon
                  end
                else
                  icon = require("lspkind").symbolic(ctx.kind, {
                    mode = "symbol",
                  })
                end
                return " " .. icon .. ctx.icon_gap
              end,


              -- Set the highlight priority to 20000 to beat the cursorline's default priority of 10000
              -- highlight = function(ctx) return { { group = ctx.kind_hl, priority = 20000 } } end,
              highlight = function(ctx)
                local hl = ctx.kind_hl
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    hl = dev_hl
                  end
                end

                return hl
              end,
            },

            kind = {
              ellipsis = false,
              width = { fill = true },
              text = function(ctx) return ctx.kind end,
              -- highlight = function(ctx) return ctx.kind_hl end,
              highlight = 'BlinkCmpLabelDescription',
            },

            label = {
              width = { fill = true, min = 60, max = 60 },
              text = function(ctx) return ctx.label .. ctx.label_detail end,
              highlight = function(ctx)
                -- label and label details
                local highlights = {
                  { 0, #ctx.label, group = ctx.deprecated and 'BlinkCmpLabelDeprecated' or 'BlinkCmpLabel' },
                }
                if ctx.label_detail then
                  table.insert(highlights, { #ctx.label, #ctx.label + #ctx.label_detail, group = 'BlinkCmpLabelDetail' })
                end

                -- characters matched on the label by the fuzzy matcher
                for _, idx in ipairs(ctx.label_matched_indices) do
                  table.insert(highlights, { idx, idx + 1, group = 'BlinkCmpLabelMatch' })
                end

                return highlights
              end,
            },

            label_description = {
              width = { max = 30 },
              text = function(ctx) return ctx.label_description end,
              highlight = 'BlinkCmpLabelDescription',
            },

            source_name = {
              width = { max = 30 },
              text = function(ctx) return ctx.source_name end,
              highlight = 'BlinkCmpSource',
            },

            source_id = {
              width = { max = 30 },
              text = function(ctx) return ctx.source_id end,
              highlight = 'BlinkCmpSource',
            },
          },

        },
      },
    },

    signature = { enabled = true },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
}
