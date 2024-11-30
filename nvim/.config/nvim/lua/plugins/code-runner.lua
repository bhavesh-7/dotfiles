return {
	"CRAG666/code_runner.nvim",
	config = function()
		-- Set up code_runner.nvim with default configuration
		require("code_runner").setup({
			mode = "term",
			focus = true,
			startinsert = true,
			highlight = "Normal",
		})

		-- Keybinding to run code
		vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false })
		vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false })
		vim.keymap.set("n", "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
		vim.keymap.set("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
		vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
		vim.keymap.set("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
		vim.keymap.set("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })
	end,
}
