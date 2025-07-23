return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({})

    -- Auto toggle bufferline visibility based on buffer count
    vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete", "BufEnter" }, {
      callback = function()
        local buffers = vim.fn.getbufinfo({ buflisted = 1 })
        if #buffers > 1 then
          vim.o.showtabline = 2
        else
          vim.o.showtabline = 0
        end
      end,
    })

    -- Keymaps for bufferline navigation
    vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
    vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

    -- Move buffers
    vim.keymap.set("n", "<leader><", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })
    vim.keymap.set("n", "<leader>>", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })

    -- Go to specific buffer (1–9)
    for i = 1, 9 do
      vim.keymap.set("n", "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<CR>", {
        desc = "Go to buffer " .. i,
      })
    end

    -- Close current buffer
    vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
  end,
}
