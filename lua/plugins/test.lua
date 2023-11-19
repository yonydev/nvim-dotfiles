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
    -- opts = function(_, opts)
    --   table.insert(
    --     opts.adapters,
    --     require("neotest-jest")({
    --       jestCommand = "npm test --",
    --       jestConfigFile = "custom.jest.config.ts",
    --       env = { CI = true },
    --       cwd = function()
    --         return vim.fn.getcwd()
    --       end,
    --     })
    --   )
    --   table.insert(opts.adapters, require("neotest-vitest"))
    -- end,
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          -- jestCommand = function()
          --   local file = vim.fn.expand("%:p")
          --   if string.find(file, "/packages/") or string.find(file, "/apps/") then
          --     return "test" -- Change this to "jest" or the actual Jest runner command
          --   end
          --   return "test" -- Change this to "jest" or the actual Jest runner command
          -- end,
          jestConfigFile = function()
            local file = vim.fn.expand("%:p")
            if string.find(file, "/packages/") then
              return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
            end

            return vim.fn.getcwd() .. "/jest.config.ts"
          end,
          env = { CI = true },
          cwd = function()
            local file = vim.fn.expand("%:p")
            if string.find(file, "/packages/") or string.find(file, "/apps/") then
              return string.match(file, "(.-/[^/]+/)src")
            end
            return vim.fn.getcwd()
          end,
        })
      )
      table.insert(opts.adapters, require("neotest-vitest"))
    end,
  },
}
