-- Open current file in finder
vim.api.nvim_create_user_command("Finder", function()
  local path = vim.api.nvim_buf_get_name(0)
  os.execute("open -R " .. path)
end, {})
-- Open current file in gnome
vim.api.nvim_create_user_command("Nau", function()
  local path = vim.api.nvim_buf_get_name(0)
  local parent_dir = string.match(path, "^(.*)/[^/]+$")
  if parent_dir == nil then -- Handle cases like "/file.txt" or "file.txt"
    parent_dir = "" -- Or handle as needed
  end
  os.execute("xdg-open " .. parent_dir)
end, {})
