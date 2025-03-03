-- Highlight on yank
local hightlight_group = vim.api.nvim_create_augroup("YankHighlight", {clear = true})
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function ()
		vim.highlight.on_yank()
	end,
	group = hightlight_group,
	pattern = "*",
})
