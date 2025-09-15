return {
  'akinsho/bufferline.nvim',
  version = "*",
  after = "catppuccin",
  dependencies = 'nvim-tree/nvim-web-devicons',

  config = function()
    vim.opt.termguicolors = true

    vim.keymap.set('n', '<leader>bp', ':BufferLinePick<CR>')
    vim.keymap.set('n', '<leader>bc', ':BufferLinePickClose<CR>')

    require("bufferline").setup {
      highlights = require("catppuccin.groups.integrations.bufferline").get_theme {
        styles = { "italic", "bold" },
      },
    }
  end
}
