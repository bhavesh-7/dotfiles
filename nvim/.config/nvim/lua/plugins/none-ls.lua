return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    local meson_null_ls = require("mason-null-ls")
    meson_null_ls.setup({
      ensure_installed = {
        'stylua',
        'prettier',
        'black',
        'isort',
        'google-java-format',
        'ktlint',
        'trivy',
        'mypy',
      },
      automatic_installation = false,
      handlers = {},
    })
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.google_java_format,
        null_ls.builtins.diagnostics.ktlint,
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.diagnostics.trivy,
        null_ls.builtins.diagnostics.mypy,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
