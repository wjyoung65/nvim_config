-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("wayne.plugins-setup")
require("wayne.core.options")
require("wayne.core.keymaps")
require("wayne.core.colorscheme")
require("wayne.plugins.comment")
require("wayne.plugins.nvim-tree")
require("wayne.plugins.lualine")
require("wayne.plugins.telescope")
require("wayne.plugins.nvim-cmp")
require("wayne.plugins.lsp.mason") -- LSP package manager
require("wayne.plugins.lsp.lspsaga")
require("wayne.plugins.lsp.lspconfig")
require("wayne.plugins.lsp.null-ls") -- formatters and linters
require("wayne.plugins.gitsigns") -- git symbols in the gutter
require("wayne.plugins.autopairs") -- auto parens, brackets, tags
require("wayne.plugins.treesitter") -- syntax highlighting
--require("wayne.plugins.nvim-dap") -- debugger integration
--require("wayne.plugins.nvim-gdb") -- gdb debugger integration

-- highlight yanked text momentarily to confirm what was yanked
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 150 }
  end,
})

-- remaps
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", {noremap = true})
vim.api.nvim_set_keymap("n", "n", "nzzzv", {noremap = true})
vim.api.nvim_set_keymap("n", "N", "Nzzzv", {noremap = true})
