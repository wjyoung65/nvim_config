local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  print("telescope could not be setup")
  return
end

-- for telescope custom keymaps
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  print("telescope.actions could not be setup")
  return
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,   -- move to previous result
        ["<C-j>"] = actions.move_selection_next,       -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      }
    }
  }
})

-- load dependency that will make telescope perform better
telescope.load_extension("fzf")
