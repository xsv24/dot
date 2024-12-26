return {
  -- Defaults https://github.com/lazyvim/lazyvim/blob/2fc7697786e72e02db91dd2242d1407f5b80856b/lua/lazyvim/plugins/extras/editor/telescope.lua#l21
  {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    lazy = true,
    event = "VeryLazy",
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        prompt_prefix = " 🔍 ",
      },
    },
  },
  {
    -- Directory navigation and search
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>se",
        -- ":Telescope file_browser<CR>",
        function()
          require("telescope").load_extension("file_browser")
          require("telescope").extensions.file_browser.file_browser()
        end,
        desc = "File tree browser",
      },
      {
        "<leader>sE",
        ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
        desc = "File tree browser (cur pos)",
      },
    },
  },
}
