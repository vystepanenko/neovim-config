local config = function()
	-- local theme = require("lualine.themes.nord")

	require("lualine").setup({
		options = {
			theme = 'nord',
			globalstatus = true,
		},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
    config = config,
}
