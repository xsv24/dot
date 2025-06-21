return {
  "nvim-neotest/neotest",
  dependencies = { "haydenmeade/neotest-jest" },
  keys = {
    {
      "<leader>tl",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Run Last Test",
    },
  },
  opts = function(_, opts)
    table.insert(
      opts.adapters,
      require("neotest-jest")({
        jestCommand = "yarn test --",
        env = { CI = true },
        cwd = function(file)
          -- Get the Current working directory for mono repos
          if string.find(file, "/libraries/") or string.find(file, "/packages/") or string.find(file, "/services/") then
            -- Find the root directory for the sub project of a mono repo

            -- For tests within __test__ dir
            local sub_project_dir = string.match(file, "(.-/[^/]+/)__tests__")

            if sub_project_dir == nil or sub_project_dir == "" then
              -- For tests within the src directory
              sub_project_dir = string.match(file, "(.-/[^/]+/)src")
            end

            return sub_project_dir
          end

          return vim.fn.getcwd()
        end,
      })
    )
  end,
}
