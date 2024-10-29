local config = function()
	require("lualine").setup({
		options = {
			theme = "nord",
			globalstatus = true,
		},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
