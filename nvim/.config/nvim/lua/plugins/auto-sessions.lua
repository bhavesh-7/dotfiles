return {
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        auto_session_suppress_dirs = {
          "~/",
          "~/Projects",
          "~/Downloads",
          "~/Desktop",
          "~/Documents",
          "~/Pictures",
          "~/Videos",
          "~/Music",
          "~/Templates",
          "~/Public",
        },
        session_lens = {
          buftypes_to_ignore = {},
          load_on_startup = true,
          theme_conf = { border = true },
          previewer = false,
        },
        pre_save_cmds = {
          "silent! lua require('neo-tree').close_all()",
          "silent! DBUIClose",
        },
      })
    end,
  },
  {
    "rmagatti/session-lens",
    dependencies = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
    config = function()
      require("session-lens").setup({
        theme_conf = { border = true },
        previewer = false,
      })
      vim.keymap.set(
        "n",
        "<Leader>ls",
        "<cmd>SearchSession<CR>",
        { noremap = true, silent = true, desc = "Search sessions" }
      )
    end,
  },
}
