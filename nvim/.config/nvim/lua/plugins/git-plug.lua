return {
	{
		"tpope/vim-fugitive",
		config = function() end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			vim.keymap.set("n", "<leader>gsp", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>gst", ":Gitsigns toggle_current_line_blame<CR>", {})
		end,
	},
}
