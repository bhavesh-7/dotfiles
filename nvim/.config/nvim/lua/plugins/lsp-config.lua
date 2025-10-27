return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "kotlin_language_server", "pylsp", "jdtls", "html" },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig") or vim.lsp.config
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
      })
      lspconfig.html.setup({
        capabilities = capabilities,
        init_options = {
          provideFormatter = true,
        },
        settings = {
          html = {
            format = {
              wrapLineLength = 120,
              unformatted = "code,pre,em,strong,span",
            },
          },
        },
        on_attach = function(client, bufnr)
          client.server_capabilities.completionProvider.triggerCharacters = { "<", " ", ":", '"', "'", "=" }
        end,
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.kotlin_language_server.setup({
        capabilities = capabilities,
      })
      lspconfig.pylsp.setup({
        capabilities = capabilities,
      })
      lspconfig.jdtls.setup({
        capabilities = capabilities,
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })
      lspconfig.lemminx.setup({
        capabilities = capabilities,
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
