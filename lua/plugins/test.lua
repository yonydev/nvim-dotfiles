return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "haydenmeade/neotest-jest",
      "marilari88/neotest-vitest",
    },
    keys = {
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run Last Test",
      },
      {
        "<leader>tL",
        function()
          require("neotest").run.run_last({ strategy = "dap" })
        end,
        desc = "Debug Last Test",
      },
      {
        "<leader>tw",
        "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
        desc = "Run Watch",
      },
    },
    opts = function(_, opts)
      local neotestJestConfig = {
        jestConfigFile = function()
          local file = vim.fn.expand("%:p")
          local packagePath = string.match(file, "(.-/packages/[^/]+)/")

          if packagePath then
            return packagePath .. "/jest.config.ts"
          end

          return vim.fn.getcwd() .. "/jest.config.ts"
        end,
        env = { CI = true },
        cwd = function()
          local file = vim.fn.expand("%:p")
          local packagePath = string.match(file, "(.-/packages/[^/]+)/")

          if packagePath then
            return packagePath
          elseif string.find(file, "/apps/") then
            return string.match(file, "(.-/[^/]+/)src")
          end

          return vim.fn.getcwd()
        end,
      }

      table.insert(opts.adapters, require("neotest-jest")(neotestJestConfig))
      table.insert(opts.adapters, require("neotest-vitest"))
    end,
  },
}
