return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional
    "ibhagwan/fzf-lua", -- optional
  },
  config = function()
    local neogit = require("neogit")

    -- Setup Neogit options
    neogit.setup({
      disable_commit_confirmation = false, -- skip confirmation
      kind = "vsplit", -- open commit messages in a split
      -- prevent slow refresh hit 'R' manually
      auto_refresh = true,
      -- use diffview
      disable_diff_highlighting = true,
      integrations = { diffview = true },
      -- open commit in a fresh temp buffer
      use_commit_editor = true,
    })

    -- -- Prevent swap file for commit buffers
    vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
      pattern = ".git/COMMIT_EDITMSG",
      callback = function()
        vim.opt_local.swapfile = false -- disables swapfile
      end,
    })

    -- Optional: cleanup leftover commit buffer if exists
    vim.api.nvim_create_user_command("NeogitCleanCommitBuffer", function()
      local bufnr = vim.fn.bufnr(".git/COMMIT_EDITMSG")
      if bufnr ~= -1 then
        vim.api.nvim_buf_delete(bufnr, { force = true })
      end
    end, { desc = "Delete stale commit buffer" })
  end,
}
