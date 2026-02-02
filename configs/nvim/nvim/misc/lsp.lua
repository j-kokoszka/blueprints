return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Mason: LSP server installer
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ts_ls",
          "html",
          "cssls",
          "texlab",
        },
      })

      -- Capabilities for nvim-cmp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Common on_attach
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end

      -- Native LSP configs (Neovim 0.11+)
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      vim.lsp.config("pyright", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config("html", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config("cssls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config("texlab", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          texlab = {
            build = {
              executable = "latexmk",
              args = {
                "-pdf",
                "-interaction=nonstopmode",
                "-synctex=1",
                "%f",
              },
              onSave = true,
              forwardSearchAfter = false,
            },
            forwardSearch = {
              executable = "zathura",
              args = {
                "--synctex-forward",
                "%l:1:%f",
                "%p",
              },
            },
            chktex = {
              onOpenAndSave = true,
              onEdit = false,
            },
            diagnosticsDelay = 300,
            latexFormatter = "latexindent",
            latexindent = {
              modifyLineBreaks = true,
            },
          },
        },
      })


      -- Enable servers
      vim.lsp.enable({
        "lua_ls",
        "pyright",
        "ts_ls",
        "html",
        "cssls",
        "texlab",
      })

    end,
  },
}

