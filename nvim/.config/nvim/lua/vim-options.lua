vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
vim.wo.number = true

-- Vim Pane Split
vim.keymap.set('n', '<leader>h', ':vsp<CR>')
vim.keymap.set('n', '<leader>v', ':sp<CR>')

-- Navigate between windows
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- keymap for copy to clipboard
vim.keymap.set('v', '<leader>y', '"+y')
