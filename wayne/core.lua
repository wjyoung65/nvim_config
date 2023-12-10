-- Set Space as the leader key
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

-- Indent and tab spacing
-- options = {
-- 	opt = {
-- 		-- set vim.opt.whatEverOptionIsDownBelow
-- 		relativenumber = true, -- sets vim.opt.relativenumber
-- 		number = true,
-- 		spell = false,
-- 		signcolumn = auto,
-- 		wrap = false,
-- 		shiftwidth = 2,
-- 		tabstop = 2,
-- 		},
-- }

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
