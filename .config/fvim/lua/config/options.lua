--  Options are automatically loaded before lazy.nvim startup
--  Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
--  Add any additional options here
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.fileencoding = "utf-8"
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.swapfile = false
vim.o.winborder = "rounded"

vim.o.cursorline = true
vim.o.scrolloff = 10

vim.opt.termguicolors = true
vim.g.have_nerd_font = false

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = false

vim.o.splitright = true
vim.o.splitbelow = true

-- vim.opt.spelllang = "en_us,ru_ru"
-- vim.opt.spell = true

-- Highlight yanked
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Sync clipboard between OS and Neovim.
-- vim.schedule(function()
--   vim.o.clipboard = "unnamedplus"
-- end)

-- Set svx filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.svx",
  callback = function()
    vim.bo.filetype = "markdown" -- Set filetype to 'svx'
  end,
})
