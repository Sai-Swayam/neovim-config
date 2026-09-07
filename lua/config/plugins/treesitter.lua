-- return {
--   "nvim-treesitter/nvim-treesitter",
--   build = ":TSUpdate",
--   config = function()
--     -- require 'nvim-treesitter.configs'.setup
--     require('nvim-treesitter').setup
--     {
--       ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "java", "javascript", "html", "css" },
--       auto_install = false,
--       highlight = {
--         enable = true,
--         disable = function(lang, buf)
--           local max_filesize = 100 * 1024 -- 100 KB
--           local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
--           if ok and stats and stats.size > max_filesize then
--             return true
--           end
--         end,
--         additional_vim_regex_highlighting = false,
--       },
--       indent = { enable = true },
--     }
--
--     local treesitter_parser_config = require('nvim-treesitter.parsers').get_parser_configs()
--     treesitter_parser_config.powershell = {
--       install_info = {
--         url = "~/.config/nvim/tsparsers/tree-sitter-powershell",
--         files = { "src/parser.c", "src/scanner.c" },
--         branch = "main",
--         generate_requires_npm = false,
--         requires_generate_from_grammar = false,
--       },
--       filetype = "ps1",
--     }
--   end,
-- }

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    -- Setup Treesitter with your preferred languages
    ts.setup {
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query",
        "markdown", "markdown_inline",
        "java", "javascript", "html", "css"
      },
      auto_install = false,
      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          return ok and stats and stats.size > max_filesize
        end,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    }

    -- Custom parser registration
    local parsers_ok, parser_configs = pcall(require, "nvim-treesitter.parsers")
    if parsers_ok and parser_configs and parser_configs.get_parser_configs then
      local configs = parser_configs.get_parser_configs()
      configs.powershell = {
        install_info = {
          url = "~/.config/nvim/tsparsers/tree-sitter-powershell",
          files = { "src/parser.c", "src/scanner.c" },
          branch = "main",
          generate_requires_npm = false,
          requires_generate_from_grammar = false,
        },
        filetype = "ps1",
      }
    end

    -- Optional: install parsers asynchronously if needed
    -- ts.install({"rust", "javascript", "zig"})
  end,
}
