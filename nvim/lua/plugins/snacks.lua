return-- lazy.nvim
{
	"folke/snacks.nvim",
	priority = 1000,
	---@type snacks.Config
	opts = {
		explorer = {

		},
		indent = {
			-- your indent configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		notifier = {

		},
		picker = {

		},

		dashboard = {
			enabled = false
		},
	},
	keys = {
		{ "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
		{ "<leader>fe", function() Snacks.explorer() end, desc = "Toggle explorer" },
		{ "<leader>fh", function () Snacks.picker.highlights() end, desc = "Find Highlight Groups"},
		{ "<leader>fd", function () Snacks.picker.diagnostics() end, desc = "Find diagnostics"},
		{ "<leader>fb", function () Snacks.picker.buffers() end, desc = "Find buffers"},
		{ "<leader>fm", function () Snacks.picker.marks() end, desc = "Find marks"},

	},

}
