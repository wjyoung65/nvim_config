local status, null_ls = pcall(require, "null-ls")
if not status then
  print("null-ls not found")
  return
end

formatting = null_ls.builtins.formatting
diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    formatting.prettier,
    formatting.stylua,
    formatting.sql_formatter,
    diagnostics.cpplint,
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
