-- use space as the leader key instead of the default backslash
vim.g.mapleader = " "

local km = vim.keymap -- for conciseness

-- general keymaps

-- when in normal mode, leader + nh will ciear highlights
km.set("n", "<leader>nh", ":nohl<CR>")

-- when in normal mode, pressing x to delete a character will not
-- also copy it into the clipboard
-- km.set("n", "x", '"_x')
-- not sure I like this one b/c it breaks xp to switch two characters

-- decrement and increment numbers with leader and plus/minus keys
km.set("n", "<leader>+", "<C-a>")
km.set("n", "<leader>-", "<C-x>")

-- window splitting, from Josean Martinez

km.set("n", "<leader>sv", "<C-w>v") -- split window vertically
km.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
km.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
km.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- tab control, also from Josean Martinez
km.set("n", "<leader>to", ":tabnew<CR>") -- open a new tab
km.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
km.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
km.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- plugin keymaps

-- vim-maximizer
km.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
km.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
km.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
km.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
km.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find text that cursor is on
km.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
km.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
