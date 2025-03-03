return
{
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {

		ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "gdscript", "rust"},

		sync_install = false,

		auto_install = false,

		highlight = { enable = true },

		indent = { enable = true },
	}


}
