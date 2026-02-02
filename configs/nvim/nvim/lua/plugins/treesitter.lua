return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",  -- updates parsers automatically
    event = { "BufReadPost", "BufNewFile" },  -- load on file open
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects", -- optional, for textobjects
    },
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "lua", "python", "javascript", "html", "css" }, -- languages to install
        highlight = {
          enable = true,      -- basic syntax highlighting
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
        },
      }
    end,
  }

}
