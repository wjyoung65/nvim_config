local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- List plugins in this table
require("lazy").setup({
	{
		"bluz71/vim-nightfly-guicolors",
		priority = 1000, -- load this before all the other start plugins
		config = function()
			-- load the colorscheme here:
			vim.cmd([[colorscheme nightfly]])
		end,
	},
})
