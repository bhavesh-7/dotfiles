return {
  "barrett-ruth/live-server.nvim",
  build = "pnpm add -g live-server",
  cmd = {
    "LiveServerStart",
    "LiveServerStop",
    "LiveServerToggle",
  },
  config = function()
    require("live-server").setup({
      args = {
        "--browser=zen",
      },
    })
  end,
  vim.keymap.set("n", "<leader>lp", ":LiveServerToggle<CR>", {}),
}
