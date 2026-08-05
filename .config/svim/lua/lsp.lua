require("mason").setup()

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, { desc = "Format Local buffer" })
vim.keymap.set("n", "<leader>i", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

vim.diagnostic.config({
  virtual_text = false,
  float = {
    border = "rounded", -- or "single", "double", "shadow", etc.
    source = true, -- show source of diagnostic (e.g. "eslint")
    focusable = true,
    style = "minimal", -- "minimal" or "full"
  }
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})

vim.lsp.enable({
  "bashls",
  "codebook",
  "lua_ls",
  "marksman",
  "svelte",
  "typescript-language-server",
})
