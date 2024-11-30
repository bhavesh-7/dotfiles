return{
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  config = function()
    vim.keymap.set("n", "<Leader>t", ":TestNearest<CR>", {})
    vim.keymap.set("n", "<Leader>T", ":TestFile<CR>", {})
    vim.keymap.set("n", "<Leader>l", ":TestLast<CR>", {})
    vim.keymap.set("n", "<Leader>g", ":TestVisit<CR>", {})
    vim.cmd("let test#strategy = 'vimux'")
  end,
}
