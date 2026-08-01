return {
  "neovim/nvim-lspconfig",
  init = function()
    -- Enable the Copilot LSP. Required: LazyVim's sidekick extra registers
    -- the `copilot` server but never enables it, and it's not in
    -- mason-lspconfig's auto-enable map. Without this, is_enabled("copilot")
    -- stays false and no ghost text appears.
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      once = true,
      callback = function()
        vim.lsp.enable("copilot")
      end,
    })

    -- Enable inline completion (respecting the toggle) + <S-CR> accept.
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
          return
        end
        if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion) then
          vim.lsp.inline_completion.enable(not vim.g.inline_completion_disabled, { bufnr = args.buf })

          -- Accept inline ghost text with Shift+Enter. If there's no
          -- suggestion, behave like a normal Enter.
          vim.keymap.set("i", "<S-CR>", function()
            if not vim.lsp.inline_completion.get() then
              return "<CR>"
            end
          end, { expr = true, buffer = args.buf, desc = "LSP: accept inline completion (Shift+CR)" })
        end
      end,
    })
  end,
  opts = {
    servers = {
      lua_ls = {},
      ts_ls = {},
      bashls = {},
      jsonls = {},
      yamlls = {},
      dockerls = {},
      docker_compose_language_service = {},
      eslint = {},
      copilot = {
        filetypes = {
          "lua",
          "typescript",
          "javascript",
          "typescriptreact",
          "javascriptreact",
          "python",
          "go",
          "rust",
          "sh",
          "bash",
          "json",
          "yaml",
          "markdown",
          "html",
          "css",
          "vim",
        },
      },
    },
  },
  keys = {
    {
      "<leader>ux",
      desc = "Toggle inline completion (ghost text)",
      function()
        local enabled = vim.g.inline_completion_disabled == true

        vim.g.inline_completion_disabled = not enabled and true or nil
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_loaded(buf) then
            pcall(vim.lsp.inline_completion.enable, enabled, { bufnr = buf })
          end
        end
        vim.notify("Inline completion " .. (enabled and "enabled" or "disabled"), vim.log.levels.INFO)
      end,
    },
  },
}
