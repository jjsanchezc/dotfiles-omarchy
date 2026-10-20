-- Minúscula = cwd, mayúscula = root (al revés que LazyVim).
return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		keys = {
			{ "<leader>e", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
			{ "<leader>E", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
		},
	},
	{
		"folke/snacks.nvim",
		keys = {
			{ "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
			{ "<leader>fF", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
			{ "<leader>sg", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
			{ "<leader>sG", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
			{ "<leader>sw", LazyVim.pick("grep_word", { root = false }), desc = "Visual selection or word (cwd)", mode = { "n", "x" } },
			{ "<leader>sW", LazyVim.pick("grep_word"), desc = "Visual selection or word (Root Dir)", mode = { "n", "x" } },
			{ "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit (cwd)" },
			{ "<leader>gG", function() Snacks.lazygit({ cwd = LazyVim.root.git() }) end, desc = "Lazygit (Root Dir)" },
			{ "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log (cwd)" },
			{ "<leader>gL", function() Snacks.picker.git_log({ cwd = LazyVim.root.git() }) end, desc = "Git Log (Root Dir)" },
			{ "<leader>ft", function() Snacks.terminal() end, desc = "Terminal (cwd)" },
			{ "<leader>fT", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, desc = "Terminal (Root Dir)" },
		},
	},
}
