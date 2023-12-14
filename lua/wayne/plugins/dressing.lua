-- This plugin helps with LSP's use of vim.ui.select()
-- and vim.ui.imput(): they will use now telescope.
-- Also, nvimtree will do this.
return {
  "stevearc/dressing.nvim",
  event = "VeryLazy", -- lazy load this plugin later, not important for initial UI
}
