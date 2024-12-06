return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		"tpope/vim-dadbod",
		"kristijanhusak/vim-dadbod-completion",
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	config = function()
		vim.g.db_ui_use_nerd_fonts = 1
	end,

	vim.keymap.set("n", "<leader>m", ":DBUIToggle <CR>", { silent = true, noremap = true }),
}
