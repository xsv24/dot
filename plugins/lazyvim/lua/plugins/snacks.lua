return {
  "folke/snacks.nvim",
  opts = { picker = { enabled = true, ui_select = true }, input = { enabled = true } },
  init = function()
    -- Re-assert snacks' vim.ui.select/input hooks if something clobbers them.
    -- snacks attaches them on `UIEnter`; mini.files snapshots `vim.ui.select` on
    -- open and restores it on close, which can leave the native numbered picker.
    -- We re-attach at the end of the `UIEnter` cascade and once nvim goes idle,
    -- but only if the handler has actually drifted from snacks.
    local function reassert()
      if package.loaded.snacks and Snacks.picker then
        if vim.ui.select ~= Snacks.picker.select then
          pcall(Snacks.picker.setup) -- sets vim.ui.select
          pcall(Snacks.input.enable) -- sets vim.ui.input
        end
      end
    end
    vim.api.nvim_create_autocmd("UIEnter", {
      nested = true,
      callback = function()
        vim.schedule(reassert)
      end,
    })
    vim.api.nvim_create_autocmd("SafeState", { once = true, callback = reassert })
  end,
}
