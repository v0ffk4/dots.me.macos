-- lua/config/autotag.lua
return {
  "windwp/nvim-ts-autotag",
  opts = {
    filetypes = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "markdown",
    },
    tags = {
      svelte = {
        component_start = { "svelte", "html" },
        component_end = { "svelte", "html" },
        element_start = { "svelte", "html" },
        element_end = { "svelte", "html" },
        snippet_start = { "svelte", "html" },
        snippet_end = { "svelte", "html" },
      },
    },
  },
}
