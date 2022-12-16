local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace behaviour
opt.backspace = "indent,eol,start"

-- clipboard: force neovim to use the system clipboard when you
-- use paste anything with the yank operator, for example.
-- Comes in handy when you want to copy something from within
-- neovim to somewhere else in your computer
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- make the dash a keyword so that dw (delete word) on
-- a text containing a dash like "hello-world" will
-- delete both hello and world, including the dash
-- opt.iskeyword:append("-")

-- mouse: disable for all modes (default is mouse=nvi)
opt.mouse = ""

-- From TJ or The Primeagen
-- highlight yanked text momentarily to confirm what was yanked
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 150 }
  end,
})

