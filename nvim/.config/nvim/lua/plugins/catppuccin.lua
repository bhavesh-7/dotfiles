return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      term_colors = true,
      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
        },
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
