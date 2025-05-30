return {
	"christoomey/vim-tmux-navigator",
	config = function()
		vim.g.tmux_navigator_no_mappings = 1
		vim.api.nvim_set_keymap("n", "<C-h>", ":TmuxNavigateLeft<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<C-j>", ":TmuxNavigateDown<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<C-k>", ":TmuxNavigateUp<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<C-l>", ":TmuxNavigateRight<CR>", { noremap = true, silent = true })
	end,
}
