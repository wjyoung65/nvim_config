local status, lspconfig = pcall(require, "lspconfig")
if not status then
  print("lspconfig not found")
  return
end

local cmp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_status then
  print("cmp_nvim_lsp not found")
  return
end

local keymap = vim.keymap -- for conciseness

-- enable keybinds for available lsp servers
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
  keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Note this did not play well with my remote work setup -- wjy
-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure each lsp server
lspconfig["asm_lsp"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- lspconfig["bashls"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })

lspconfig["clangd"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["cmake"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["dockerls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["jsonls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["sumneko_lua"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

lspconfig["zk"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["perlnavigator"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["jedi_language_server"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["rust_analyzer"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["sqlls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
