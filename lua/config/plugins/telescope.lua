return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
      }
    },

    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')
      telescope.setup {
        defaults = {
          path_display = { "smart" },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist,
            }
          }
        },
        pickers = {
          find_files = {
            theme = "ivy"
          }
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        },
        sorting_strategy = "ascending",
        layout_strategy = "flex",
        layout_config = {
          horizontal = { preview_cutoff = 80, preview_width = 0.55 },
          vertical = { mirror = true, preview_cutoff = 25 },
          prompt_position = "top",
          width = 0.87,
          height = 0.80,
        },
      }

      require('telescope').load_extension('fzf')

      vim.keymap.set('n', '<leader>ls', require('telescope.builtin').find_files,
        { desc = 'List files in current directory' })
      vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'Find recently opened files' })
      vim.keymap.set('n', '<leader>gs', require('telescope.builtin').live_grep, { desc = 'Find string in pwd' })
      vim.keymap.set('n', '<leader>gw', require('telescope.builtin').grep_string,
        { desc = 'Find string in current file' })
      vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>en', function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)


      require "config.telescope.multigrep".setup()
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  },
}
