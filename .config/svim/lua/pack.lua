vim.pack.add({
  "https://github.com/bluz71/vim-moonfly-colors",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/vague-theme/vague.nvim",
  -- "https://github.com/rafamadriz/friendly-snippets",
  { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim", branch = "main" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter",           branch = "main" },
})

---- Mason ----
require("mason-tool-installer").setup({
  ensure_installed = {
    "bash-language-server",
    "codebook",
    "lua-language-server",
    "marksman",
    "prettier",
    "stylua",
    "svelte-language-server",
    "typescript-language-server",
  },
  auto_update = true,
  run_on_start = true,
})

---- Oil ----
require("oil").setup({
  delete_to_trash = true,
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, _)
      return name == ".." or name == ".git" or name == ".DS_Store"
    end,
  },
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  callback = function()
    vim.opt_local.cursorline = true
  end,
})

---- mini notify ----
require("mini.notify").setup({
  -- only show messages
  content = {
    format = function(notif)
      return notif.msg
    end,
  },
})

--- mini cmdline completion ---
require("mini.cmdline").setup({
  autocorrect = { enable = false },
})

--- mini surround ---
require("mini.surround").setup({
  mappings = {
    add = 'msa',
    delete = 'msd',
    replace = 'msr',
    find = 'msf',
    find_left = 'msF',
    highlight = 'msh',
    update_n_lines = 'msn',
  }
})
-- Default Keymaps
-- | `sa` | Add surrounding or Direct with 'saiw' |
-- | `sd` | Delete surrounding |
-- | `sr` | Replace surrounding |
-- | `sf` | Find surrounding (right) |
-- | `sF` | Find surrounding (left) |
-- | `sh` | Highlight surrounding |
-- | `sn` | Update n_lines |
-- | `l` / `n` | as suffix for prev/next |

--- mini picker ---
local MiniPick = require("mini.pick")
local MiniExtra = require("mini.extra")
MiniPick.setup()
MiniExtra.setup()

-- keymaps
vim.keymap.set("n", "<leader>ff", function()
  MiniPick.builtin.files()
end, { desc = "Mini File Picker" })
-- vim.keymap.set("n", "<leader>fr", function()
--   MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") })
-- end, { desc = "Grep word/Search word" })
vim.keymap.set("n", "<leader>fr", MiniPick.builtin.grep_live, { desc = "Find GREP" })
vim.keymap.set("n", "<leader>fb", MiniPick.builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", function()
  MiniPick.builtin.help()
end, { desc = "Mini Help" })

vim.keymap.set("n", "<leader>xx", function()
  MiniExtra.pickers.diagnostic()
end, { desc = "Mini Picker Diagnostics" })
vim.keymap.set("n", "<leader>pk", function()
  MiniExtra.pickers.keymaps()
end, { desc = "Search keymaps" })

--- mini completions ---
require("mini.completion").setup({
  lsp_completion = {
    auto_setup = true,
  },
})

--- mini snippets ---
local MiniSnippets = require("mini.snippets")
MiniSnippets.setup({
  snippets = {
    MiniSnippets.gen_loader.from_lang(), -- loads friendly-snippets
  },
})
MiniSnippets.start_lsp_server({ match = false })

--- mini diff ---
local MiniDiff = require("mini.diff")
MiniDiff.setup({
  source = MiniDiff.gen_source.git({ index = false }),
})

---- mini extra ----
local MiniExtra = require("mini.extra")

vim.keymap.set("n", "<leader>ft", function()
  MiniExtra.pickers.treesitter({
    source = "current", -- Show symbols from current buffer
    mode = "symbols",   -- Focus on document symbols
  })
end, { desc = "Show document AST" })

vim.keymap.set("n", "<leader>fo", function()
  MiniExtra.pickers.lsp({
    source = "current",        -- Show symbols from current buffer
    scope = "document_symbol", -- Scope document symbols
  })
end, { desc = "Show document outline" })

require("mini.pairs").setup({
  modes = {
    insert = true,
    command = false,
    terminal = false,
  },
})
