-- Install and configure mason, which installs and manages language
-- servers for neovim lsp. Some may fail to install unless npm is
-- available. To install npm in Arch: sudo pacman -Sy npm
return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")  -- import mason
    local mason_lspconfig = require("mason-lspconfig")  -- import mason-lspconfig
    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "lua_ls",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "cpptools",
        "ansible-language-server",
        "ansible-lint",
        "isort", -- python formatter
        "black", -- python formatter
        "pylint", -- python linter
--        "eslint_d", -- js linter
      },
    })
  end,
}
