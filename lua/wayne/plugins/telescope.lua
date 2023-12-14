-- This plugin is for fuzzy finding files and strings
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build="make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = { -- keymaps in insert mode:
            -- move to previous result
            ["<C-k>"] = actions.move_selection_previous,

            -- move to next result
            ["<C-j>"] = actions.move_selection_next,

            -- send selected results to the quickfix list:
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          }
        }
      }
    })

    -- load the fzf extension to improve telescope sorting performance
    telescope.load_extension("fzf");

    -- custom keymaps for using telescope
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {desc = "Fuzzy find files in the cwd"})
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", {desc = "Fuzzy find recent files"})
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", {desc = "Find a string in the cwd"})
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", {desc = "Find string under cursor in the cwd"})
  end
}
