return {
  -- Color picker floating window
  {
    "uga-rosa/ccc.nvim",
    config = function()
      require("ccc").setup({
        highlighter = {
          auto_enable = true,  -- highlight colors automatically
        },
        picker = "default",    -- floating picker
      })

      -- Optional keymap to open picker under cursor
      vim.api.nvim_set_keymap(
        "n",
        "<leader>cp",
        "<cmd>CccPick<CR>",
        { noremap = true, silent = true }
      )
    end,
  },

  -- Inline color highlighting everywhere
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "*",  -- enable in all filetypes
        -- css = { rgb_fn = true }, -- enable rgb() highlighting
        -- html = { names = true }, -- enable color names
      }, {
        RGB = true,       -- #RGB
        RRGGBB = true,    -- #RRGGBB
        names = true,     -- "blue", "red", etc
        RRGGBBAA = true,  -- #RRGGBBAA
        rgb_fn = true,    -- rgb() and rgba()
        hsl_fn = true,    -- hsl() and hsla()
        css = true,       -- enable all css features
        css_fn = true,    -- enable all css functions
        mode = "background", -- or "foreground"
      })
    end,
  },
}
