return {
  {
    "echasnovski/mini.pick",
    version = "*",
    config = function()
      local mpk = require("mini.pick")
      mpk.setup()
      -- vim.api.nvim_set_hl(0, "MiniPickCurrent", { link = "CursorLine" })

      vim.keymap.set("n", "<leader>ff", mpk.builtin.files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", function()
        mpk.builtin.files({ tool = "git", tool_opts = { use_git_root = true } })
      end, { desc = "Find git files" })
      vim.keymap.set("n", "<leader>fb", mpk.builtin.buffers, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fr", mpk.builtin.grep_live, { desc = "Find GREP" })
    end,
  },
  {
    "echasnovski/mini.extra",
    version = "*",
    config = function()
      local mex = require("mini.extra")

      vim.keymap.set("n", "<leader>ft", function()
        mex.pickers.treesitter({
          source = "current", -- Show symbols from current buffer
          mode = "symbols", -- Focus on document symbols
        })
      end, { desc = "Show document AST" })

      vim.keymap.set("n", "<leader>fo", function()
        mex.pickers.lsp({
          source = "current", -- Show symbols from current buffer
          scope = "document_symbol", -- Scope document symbols
        })
      end, { desc = "Show document outline" })
    end,
  },
  {
    "echasnovski/mini.pairs",
    version = "*",
    opts = {
      modes = {
        insert = true,
        command = false,
        terminal = false,
      },
    },
  },
  { "echasnovski/mini.comment", version = "*", opts = {} },
  {
    "echasnovski/mini.surround",
    version = "*",
    opts = {
      mappings = {
        add = "gmsa", -- Add surrounding in Normal and Visual modes
        delete = "gmsd", -- Delete surrounding
        find = "gmsf", -- Find surrounding (to the right)
        find_left = "gmsF", -- Find surrounding (to the left)
        highlight = "gmsh", -- Highlight surrounding
        replace = "gmsr", -- Replace surrounding
        update_n_lines = "gmsn", -- Update `n_lines`

        suffix_last = "l", -- Suffix to search with "prev" method
        suffix_next = "n", -- Suffix to search with "next" method
      },
    },
  },
  { "echasnovski/mini.move", version = "*", opts = {} },
}
