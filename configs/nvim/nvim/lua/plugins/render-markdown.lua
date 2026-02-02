return {
-- === 2. Render Markdown (Markdown Plugin) ===
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" }, -- tylko dla plików markdown
    opts = {
      -- Automatyczne renderowanie po otwarciu pliku
      render_modes = { "n", "i" }, -- renderuj w normal i insert mode
      debounce = 100,              -- opóźnienie renderu (ms)
      file_types = { "markdown" },

      -- Styl renderowania
      heading = {
        enabled = true,
        icons = { "󰎥 ", "󰎧 ", "󰎩 ", "󰎫 ", "󰎭 ", "󰎯 " },
        signs = true, -- dodaj ikonki przy nagłówkach
        border = false,
      },
      code = {
        enabled = true,
        sign = true,
        style = "normal", -- "minimal" też możliwe
      },
      bullet = {
        enabled = true,
        icons = { "•", "◦", "▪" },
      },
      checkbox = {
        enabled = true,
        unchecked = "󰄱",
        checked = "󰄵",
        partial = "󰡖",
      },
      quote = {
        enabled = true,
        icon = "󰝖",
        repeat_linebreak = true,
      },
    },
    keys = {
      {
        "<leader>mr",
        function()
          require("render-markdown").toggle()
        end,
        desc = "Toggle Markdown render",
      },
    },
  },
}
