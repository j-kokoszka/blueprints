return {
-- === 1. VimTeX (LaTeX Plugin) ===
  {
    "lervag/vimtex",
    -- ft = { "tex", "latex", "plaintex" },
    lazy = false,
    
    config = function()
      -- === Konfiguracja VimTeX ===
      -- vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_method = 'generic'
      vim.g.vimtex_quickrun_enabled = true

      -- vim.g.vimtex_compiler_latexmk = {
      --   args = { '-pdf', '-silent', '-keep-intermediates', '-auxdir=temp', '-outdir=out' },
      -- }
      
      
      vim.g.vimtex_compiler_generic = {
          command = 'make',
          -- optional: automatically run make clean when you stop compilation
          -- (not recommended if clean deletes PDFs, which your Makefile does)
      }

      -- Optional: If you want VimTex to use the Makefile's clean target
      -- instead of its internal clean function:
      vim.g.vimtex_clean_method = 'generic' 
      -- Note: This requires a custom mapping or manual invocation of `make clean`
      
      vim.g.vimtex_view_method = 'zathura'
      
      -- Włącz Forward Search po kompilacji
      vim.g.vimtex_view_forward_search_on_compile = true
      
      -- Ustawienia dla Zathura (dostosuj dla swojej przeglądarki)
      if vim.g.vimtex_view_method == 'zathura' then
        vim.g.vimtex_view_general_command = 'zathura'
      end
      
      vim.g.vimtex_syntax_enabled = 1

      -- Disable warning output
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.g.vimtex_quickfix_open_on_error = 1

      vim.g.vimtex_complete_enabled = 1
      vim.g.vimtex_complete_close_braces = 1
      vim.g.vimtex_complete_recursive_bib = 0

    end
  },

}


