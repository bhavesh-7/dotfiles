return{
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    wk.setup({
      win = {
        border = "rounded", -- optional
      },
    })

    -- Single key to open which-key manually
    vim.keymap.set("n", "<leader>?", "<cmd>WhichKey<cr>", { desc = "Show all keybindings" })
  end,
}
