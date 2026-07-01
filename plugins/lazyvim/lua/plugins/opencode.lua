return {
  "nickjvandyke/opencode.nvim",
  dependencies = {
    {
      -- NOTE: snacks already configured as the picker in `snacks.lua`.
      -- This fragment only adds opencode's integration into the snacks picker.

      ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
      "folke/snacks.nvim",
      optional = true,
      opts = {
        picker = {
          actions = {
            ---@param picker snacks.Picker
            opencode_send = function(picker)
              local items = vim.tbl_map(function(item) ---@param item snacks.picker.Item
                return item.file
                    and require("opencode").format({ path = item.file, from = item.pos, to = item.end_pos })
                  or item.text
              end, picker:selected({ fallback = true }))

              require("opencode").prompt(table.concat(items, ", ") .. " ")
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
    local opencode_cmd = "opencode --port"
    local snacks_terminal_opts = {
      win = {
        position = "right",
        enter = false,
      },
    }
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      server = {
        start = function()
          require("snacks.terminal").open(opencode_cmd, snacks_terminal_opts)
        end,
      },
    }

    vim.o.autoread = true -- Required for `opts.events.reload`

    -- Recommended/example keymaps
    vim.keymap.set({ "n", "x" }, "<leader>pa", function()
      require("opencode").ask("@this: ", { submit = true })
    end, { desc = "Ask opencode…" })

    vim.keymap.set({ "n", "x" }, "<leader>pA", function()
      require("opencode").ask("@this: ", { submit = false })
    end, { desc = "Ask opencode…" })

    vim.keymap.set("n", "<leader>pf", function()
      require("opencode").ask("@this-path: ", { submit = true })
    end, { desc = "Ask about current buffer" })

    vim.keymap.set("n", "<leader>pF", function()
      require("opencode").ask("@this-path: ", { submit = false })
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

    vim.keymap.set({ "n", "x" }, "<leader>pt", function()
      require("snacks.terminal").toggle(opencode_cmd, snacks_terminal_opts)
    end, { desc = "Toggle OpenCode" })

    vim.keymap.set({ "n", "x" }, "pc", function()
      return require("opencode").operator("@this ")
    end, { desc = "Add range to opencode", expr = true })

    vim.keymap.set("n", "<leader>ps", function()
      require("opencode.server.discovery").get():next(function(server)
        return require("opencode.ui.select_session").select_session(server):next(function(session)
          return server:select_session(session.id)
        end)
      end)
    end, { desc = "Select opencode session" })

    vim.keymap.set("n", "py", function()
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

    -- TODO: ? Optionally show upon submitting prompt
    vim.api.nvim_create_autocmd("User", {
      pattern = { "OpencodeEvent:tui.command.execute" },
      callback = function(args)
        ---@type opencode.server.Event
        local event = args.data.event
        if event.properties.command == "prompt.submit" then
          local win = require("snacks.terminal").get(opencode_cmd, { create = false })
          if win then
            win:show()
          end
        end
      end,
    })
  end,
}
