local opt = vim.opt -- for conciseness

-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true -- expand tab to spaces. Q: is this compatible with Lua coding style?
opt.autoindent = true -- copy indent from current line when starting a new one

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if search term uses mixed case, assume case-sensitive search

-- cursor line
opt.cursorline = true

-- Appearance
opt.termguicolors = true -- need this for nightfly colorscheme, needs true color terminal
opt.background = dark -- colorschemes that support light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line, or insert mode start position

-- clipboard
-- todo: is this best for Linux, Windows?
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- line number
opt.number = true
opt.relativenumber = true
