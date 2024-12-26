return {
  {
    "hrsh7th/nvim-cmp",
    keys = { "/", ":" },
    dependencies = {
      "hrsh7th/cmp-cmdline",
      opts = function(_, opts)
        local cmp = require("cmp")

        opts.setup.cmdline("/", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = "buffer" },
          },
        })

        opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        })

        opts.setup.cmdline(":", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = "path" },
          }, {
            {
              name = "cmdline",
              option = {
                ignore_cmds = { "Man", "!" },
              },
            },
          }),
        })
      end,
    },
  },
}
