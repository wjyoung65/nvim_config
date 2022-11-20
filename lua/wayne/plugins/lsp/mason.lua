local mason_status, mason = pcall(require, "mason")
if not mason_status then
  print("mason not found")
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  print("mason-lspconfig not found")
  return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  print("mason-null-ls not found")
  return
end

mason.setup()

-- Some are commented out because mason-lspconfig says it
-- is installing them every time nvim is started. Is there
-- missing config or is that normal? I don't need them aiways
-- anyway, probably there is a per-project way to configure
-- nvim for plugins like these.
mason_lspconfig.setup({
  ensure_installed = {
--    "asm_lsp", -- GAS/NASM assembly
--    "bashls", -- bash
    "clangd", -- C/C++
    "cmake", -- cmake
 --   "dockerls", -- docker
 --   "jsonls", -- json
    "sumneko_lua", -- lua
    "zk", ---markdown
 --   "perlnavigator", -- perl
    "jedi_language_server", -- python
    "rust_analyzer", -- rust
 --   "sqlls", -- sql
  }
})

mason_null_ls.setup({
  ensure_installed = {
    "prettier",
    "cpplint", -- C / C++
    "stylua", -- formatter for lua code
    "pylint", -- python
    "sql_formatter", -- sql
  }
})

