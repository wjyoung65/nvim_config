local status, null_ls = pcall(require, "null-ls")
if not status then
  print("null-ls not found")
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- local hover = null_ls.builtins.hover

-- my diagnostics config for all linters
--   underlines no because it makes the screen too busy
local diag_config = {
            -- see :help vim.diagnostic.config()
            underline = false,
            virtual_text = true,
            signs = true,
            -- update_in_insert = false,
            -- severity_sort = true,
}

null_ls.setup({
  sources = {
    formatting.prettier,
    formatting.stylua,
    formatting.sql_formatter,
    diagnostics.cpplint.with({
        -- Need to override args because extra_args does not work.
        -- Be sure to put filename last. Also, do not use quotes
        -- for the filter option.
        args = { "--filter=-whitespace/parens,-legal", "$FILENAME"},
        diagnostic_config = diag_config,
    }),
    diagnostics.pylint,
  }
})


-- suppress this warning
local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
end
