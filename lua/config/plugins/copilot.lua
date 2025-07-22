return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_enabled = false -- disable copilot by default untile user enables it
    vim.g.copilot_no_tab_map = true  -- Disable default tab mapping
    vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
  end,
}
