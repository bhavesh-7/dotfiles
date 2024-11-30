return {
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
			pre_save_cmds = { "silent! lua require('neo-tree').close_all()" },
		})
		vim.keymap.set(
			"n",
			"<Leader>ls",
			require("auto-session.session-lens").search_session,
			{ noremap = true, silent = true }
		)
	end,
}
