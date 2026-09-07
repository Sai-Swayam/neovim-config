return {
  'nvim-lualine/lualine.nvim',
  event = "VeryLazy",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- Indicate when code is formatted
    local format_status = ""
    local copilot_status = ""

    _G.show_format_status = function()
      format_status = "Formatted"
      vim.defer_fn(function()
        format_status = ""
        require("lualine").refresh()
      end, 1000)
      require("lualine").refresh()
    end

    _G.show_copilot_autocomplete_status = function()
      local status = vim.g.copilot_enabled
      if status == false then
        copilot_status = "Copilot Disabled"
      else
        copilot_status = "Copilot Enabled"
      end
      require("lualine").refresh()
      vim.defer_fn(function()
        copilot_status = ""
      end, 1000)
      require("lualine").refresh()
    end


    local colors = {
      bg     = '#0b0b12',
      fg     = '#cad3f5',
      blue   = '#8aadf4',
      green  = '#a6da95',
      violet = '#c6a0f6',
      red    = '#ed8796',
    }

    local custom_theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.blue },
        b = { fg = colors.blue, bg = "NONE" },
        x = { fg = colors.blue, bg = "NONE" },
        z = { fg = colors.blue, bg = "NONE" },
      },

      insert = {
        a = { fg = colors.bg, bg = colors.green },
        b = { fg = colors.green, bg = "NONE" },
        x = { fg = colors.green, bg = "NONE" },
        z = { fg = colors.green, bg = "NONE" },
      },
      visual = {
        a = { fg = colors.bg, bg = colors.violet },
        b = { fg = colors.violet, bg = "NONE" },
        x = { fg = colors.violet, bg = "NONE" },
        z = { fg = colors.violet, bg = "NONE" },
      },
      replace = {
        a = { fg = colors.bg, bg = colors.red },
        b = { fg = colors.red, bg = "NONE" },
        x = { fg = colors.red, bg = "NONE" },
        z = { fg = colors.red, bg = "NONE" },
      },

      inactive = {
        a = { fg = colors.fg, bg = colors.bg },
        b = { fg = colors.fg, bg = "NONE" },
        c = { fg = colors.fg, bg = "NONE" },
        z = { fg = colors.fg, bg = "NONE" },
      },
    }
    require('lualine').setup {
      options = {
        icons_enabled = true,
        -- theme = 'catppuccin',
        theme = custom_theme,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = { 'snacks_dashboard' },
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },

        lualine_b = {
          {
            'buffers',
            show_filename_only = true,       -- Shows shortened relative path when set to false.
            hide_filename_extension = false, -- Hide filename extension when set to true.
            show_modified_status = true,     -- Shows indicator when the buffer is modified.

            mode = 0,                        -- 0: Shows buffer name
            -- 1: Shows buffer index
            -- 2: Shows buffer name + buffer index
            -- 3: Shows buffer number
            -- 4: Shows buffer name + buffer number

            max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
            -- it can also be a function that returns
            -- the value of `max_length` dynamically.
            filetype_names = {
              TelescopePrompt = 'Telescope',
              dashboard = 'Dashboard',
              packer = 'Packer',
              fzf = 'FZF',
              alpha = 'Alpha'
            }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

            -- Automatically updates active buffer color to match color of other components (will be overidden if buffers_color is set)
            use_mode_colors = true,

            -- buffers_color = {
            --   active = { fg = colors.blue, bg = "NONE" },
            --   inactive = { fg = colors.fg, bg = "NONE" },
            -- },

            symbols = {
              modified = ' ●', -- Text to show when the buffer is modified
              alternate_file = '', -- Text to show to identify the alternate file
              directory = '', -- Text to show when the buffer is a directory
            },
          } },

        lualine_c = {

          {
            function()
              return format_status
            end,
            color = { fg = colors.green },
          },

          {
            function()
              return copilot_status
            end,
            color = { fg = colors.green },
          }

          -- 'indent'
        },

        lualine_x = { {
          'filename',
          file_status = true,     -- Displays file status (readonly status, modified status)
          newfile_status = false, -- Display new file status (new file means no write after created)
          path = 1,               -- 0: Just the filename
          -- 1: Relative path
          -- 2: Absolute path
          -- 3: Absolute path, with tilde as the home directory
          -- 4: Filename and parent dir, with tilde as the home directory

          shorting_target = 40, -- Shortens path to leave 40 spaces in the window
          -- for other components. (terrible name, any suggestions?)
          symbols = {
            modified = '[+]',      -- Text to show when the file is modified.
            readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
            unnamed = '[No Name]', -- Text to show for unnamed buffers.
            newfile = '[New]',     -- Text to show for newly created file before first write
          }
        } },

        lualine_y = {
          {
            'diagnostics',
            sources = { 'nvim_lsp', 'nvim_diagnostic' },
            sections = { 'error', 'warn' },
            diagnostics_color = {
              -- Same values as the general color option can be used here.
              error = 'DiagnosticError', -- Changes diagnostics' error color.
              warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
              info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
              hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
            },
            symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
            colored = true,
            always_visible = false,
            update_in_insert = true,
          },
          {
            'branch',
            -- icon = { '', color = { fg = colors.blue }}
            icon = { '' }
          }
        },

        lualine_z = {
          -- 'indent',

          'location',
          {
            function()
              local reg = vim.fn.reg_recording()
              if reg == '' then
                return ''
              else
                return 'Recording @' .. reg
              end
            end,
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end,
}
