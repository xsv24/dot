return {
  {
    "nvim-mini/mini.files",
    lazy = false,
    opts = {
      -- You can configure options here if needed
      use_as_default_explorer = true,
    },
    config = function(_, opts)
      -- Disable default netrw tree
      vim.g.loaded_netrwPlugin = 1
      vim.g.loaded_netrw = 1

      vim.keymap.set("n", "<leader>e", function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end, { desc = "Open mini.files (Directory of Current File)" })

      vim.keymap.set("n", "<leader>E", function()
        require("mini.files").open(vim.uv.cwd(), true)
      end, { desc = "Open mini.files (Directory of Current File)" })

      -- Auto Load mini-files on start up.
      -- Deferred with `vim.schedule` so it opens AFTER `UIEnter` (when snacks
      -- attaches its `vim.ui.select`). Otherwise mini.files snapshots the native
      -- `vim.ui.select` on open and restores it on close, clobbering the snacks
      -- picker for the rest of the session.
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          local arg = vim.fn.argv(0)
          if arg and vim.fn.isdirectory(arg) == 1 then
            vim.schedule(function()
              require("mini.files").open(arg, true)
            end)
          end
        end,
      })
    end,
  },
}
