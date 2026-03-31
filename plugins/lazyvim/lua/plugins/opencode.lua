return {
  "nickjvandyke/opencode.nvim",
  dependencies = {
    {
      -- `snacks.nvim` integration is recommended, but optional
      ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
      "folke/snacks.nvim",
      optional = true,
      opts = {
        input = {}, -- Enhances `ask()`
        picker = { -- Enhances `select()`
          actions = {
            opencode_send = function(...)
              return require("opencode").snacks_picker_send(...)
            end,
          },
          win = {
            input = {
              keys = {
                ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
              },
            },
          },
        },
      },
    },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any; goto definition on the type or field for details
    }

    vim.o.autoread = true -- Required for `opts.events.reload`

    -- Recommended/example keymaps
    vim.keymap.set({ "n", "x" }, "<leader>pa", function()
      require("opencode").ask("@this: ", { submit = true })
    end, { desc = "Ask opencode…" })

    vim.keymap.set("n", "<leader>pf", function()
      require("opencode").ask("@this-path: ", { submit = true })
    end, { desc = "Ask about current buffer" })

    vim.keymap.set("n", "<leader>pi", function()
      local line = vim.fn.line(".") - 1 -- 0-indexed
      local diagnostics = vim.diagnostic.get(0, { lnum = line })
      
      if #diagnostics == 0 then
        vim.notify("No diagnostics on current line", vim.log.levels.WARN)
        return
      end
      
      local messages = {}
      for _, diag in ipairs(diagnostics) do
        table.insert(messages, diag.message)
      end
      
      local prompt = string.format("@this-path: fix this diagnostic: %s", table.concat(messages, "; "))
      require("opencode").ask(prompt, { submit = true })
    end, { desc = "Fix diagnostic on current line" })

    vim.keymap.set({ "n", "x" }, "<leader>px", function()
      require("opencode").select()
    end, { desc = "Execute opencode action…" })
    vim.keymap.set({ "n", "t" }, "<leader>pt", function(file)
      require("opencode").toggle()
    end, { desc = "Toggle opencode" })

    vim.keymap.set({ "n", "x" }, "gp", function()
      return require("opencode").operator("@this ")
    end, { desc = "Add range to opencode", expr = true })

    vim.keymap.set("n", "gP", function()
      return require("opencode").operator("@this ") .. "_"
    end, { desc = "Add line to opencode", expr = true })

    vim.keymap.set("n", "<S-C-u>", function()
      require("opencode").command("session.half.page.up")
    end, { desc = "Scroll opencode up" })
    vim.keymap.set("n", "<S-C-d>", function()
      require("opencode").command("session.half.page.down")
    end, { desc = "Scroll opencode down" })

    -- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above — otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap)
    vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
    vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
  end,
}
