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
  -- need this table b/c lazy.nvim won't automatically load plugins in nested folders
  {import = "wayne.plugins"},
  {import = "wayne.plugins.lsp"},
}, {
  install = {
    -- Whenever a plugin is loaded, set this color scheme
    -- Why needed again? I don't really like duplication
    colorscheme = {"nightfly"},
  },
  -- Josean prefers to have Lazy's check and change detection in the status line
  -- see lualine.lua, lazy.status module, lazy_status.updates
  checker = {
    enabled = true,
    notify = false, -- don't notify with each check
  },
  change_detection = {
    notify = false,
  }
})
