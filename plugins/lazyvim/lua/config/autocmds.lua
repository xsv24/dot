-- Default auto commands  https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Autocmds are automatically loaded on the VeryLazy event

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    -- We disable the line wrap_spell that LazyVim sets
    -- https://github.com/LazyVim/LazyVim/blob/d0c366e4d861b848bdc710696d5311dca2c6d540/lua/lazyvim/config/autocmds.lua#L102
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
