-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  print("treesitter not found")
  return
end

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = { enable = true, },
  -- enable indentation
  indent = { enable = true },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- ensure these language parsers are installed
  ensure_installed = {
    "c",
    "cpp",
    "json",
    "perl",
    "python",
--    "sql",
    "bash",
    "lua",
    "vim",
    "dockerfile",
--    "gitignore",
  },
  -- auto install above language parsers
  auto_install = true,
  sync_install = false, -- install parsers synchronously
})
