return
{
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			{

				"folke/lazydev.nvim",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")
			local gdscript_config = {
				capabilities = capabilities,
				settings = {},
				cmd = {"ncat", "127.0.0.1", "6005"},
			}
			-- gdscript_config['cmd'] = {'ncat', 'localhost', os.getenv('GDScript_Port' or '6005')}
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })
			lspconfig.gdscript.setup(gdscript_config)
		end,
	}

}

