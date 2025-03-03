return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
    {

	    "lewis6991/gitsigns.nvim",
	    opts = {},
    }

  },
  config = true
}

