vim.g.nord_italic = false
vim.g.nord_disable_background = false
return {
	-- "arcticicestudio/nord-vim",
	"shaunsingh/nord.nvim",
	lazy = false,
	priority = 999,
	config = function()
		vim.cmd("colorscheme nord")
	end,
}
