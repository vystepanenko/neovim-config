return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	config = function()
		vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=None]])
		require("nvim-tree").setup({
			view = {
				relativenumber = true,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
			},
			filters = {
				dotfiles = false,
			},
			update_focused_file = {
				enable = true,
			},
		})
	end,
}
