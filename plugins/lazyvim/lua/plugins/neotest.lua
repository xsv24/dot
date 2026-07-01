return {
  "nvim-neotest/neotest",
  dependencies = { "haydenmeade/neotest-jest" },
  keys = {
    {
      "<leader>tc",
      function()
        local choices = {
          { name = "Nearest test", value = "nearest" },
          { name = "Current file", value = vim.fn.expand("%") },
          { name = "Full suite", value = "suite" },
        }

        local format_item = function(item)
          return item.name
        end

        local on_select = function(choice)
          if not choice then
            return
          end

          local args = {}
          if choice.value == "suite" then
            args.suite = true
          else
            args.position = choice.value
          end

          require("neotest").run.run(args)
        end

        vim.ui.select(choices, { prompt = "Run test:", format_item = format_item }, on_select)
      end,
    },
    {
      "<leader>tl",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Run Last Test",
    },
    {
      "<leader>tpc",
      function()
        require("neotest").run.run({
          suite = false,
          extra_args = { "--silent=false" },
        })
      end,
      desc = "Run Test with --silent=false",
    },
    {
      "<leader>tpa",
      function()
        require("neotest").run.run({
          suite = false,
          env = { LOG_SILENT = "false" },
          extra_args = { "--silent=false" },
        })
      end,
      desc = "Run Test with all logs",
    },
  },
  opts = function(_, opts)
    table.insert(
      opts.adapters,
      require("neotest-jest")({
        jestCommand = "yarn test --",
        env = { CI = true },
        -- neotest-jest captures cwd at load time (nvim startup), so hasJestDependency
        -- falls back to checking the monorepo root package.json which lacks a "jest"
        -- key (only babel-jest), causing all test files to be unrecognised.
        -- Override with a simple pattern match instead.
        isTestFile = function(file_path)
          if not file_path then
            return false
          end
          return string.match(file_path, "%.spec%.[tj]sx?$") ~= nil
            or string.match(file_path, "%.test%.[tj]sx?$") ~= nil
        end,
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
