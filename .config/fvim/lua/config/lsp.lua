-- Diagnostic appearance
-- vim.diagnostic.config({
--   signs = {
--     text = {
--       [vim.diagnostic.severity.ERROR] = "󰅚 ",
--       [vim.diagnostic.severity.WARN] = "󰀪 ",
--       [vim.diagnostic.severity.INFO] = "󰋽 ",
--       [vim.diagnostic.severity.HINT] = "󰌶 ",
--     },
--   },
-- })
--
-- -- Autocmd
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
--   callback = function(event)
--     local map = function(keys, func, desc)
--       vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
--     end
--
--     map("gl", vim.diagnostic.open_float, "Open diagnostic float")
--     map("K", vim.lsp.buf.hover, "Hover documentation")
--     map("gs", vim.lsp.buf.signature_help, "Signature documentation")
--     map("gd", vim.lsp.buf.definition, "Goto definition")
--     map("gD", vim.lsp.buf.declaration, "Goto declaration")
--     map("<F4>", vim.lsp.buf.code_action, "Code action")
--     map("<F2>", vim.lsp.buf.rename, "Rename all references")
--
--     local client = vim.lsp.get_client_by_id(event.data.client_id)
--
--     -- Svelte fix
--     if client and client.name == "svelte" then
--       vim.api.nvim_create_autocmd("BufWritePost", {
--         pattern = { "*.js", "*.ts" },
--         group = vim.api.nvim_create_augroup("svelte_ondidchangetsorjsfile", { clear = true }),
--         callback = function(ctx)
--           client:notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
--         end,
--       })
--     end
--   end,
-- })

vim.lsp.enable("lua_ls")
vim.lsp.enable("svelte")
vim.lsp.enable("typescript-language-server")
vim.lsp.enable("codebook")
