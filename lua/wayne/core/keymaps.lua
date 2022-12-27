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
--km.set("n", "<leader>+", "<C-a>")
--km.set("n", "<leader>-", "<C-x>")

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
-- Josean's keymaps
-- km.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
-- km.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
-- km.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find text that cursor is on
-- km.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
-- km.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
-- TJ's keymaps
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- ^u and ^d with auto recenter, from The Primeagen
km.set("n", "<C-d>", "<C-d>zz", {noremap = true})
km.set("n", "<C-u>", "<C-u>zz", {noremap = true})
km.set("n", "n", "nzzzv", {noremap = true})
km.set("n", "N", "Nzzzv", {noremap = true})
