return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          on_attach = function(client, buffer)
            require("twoslash-queries").attach(client, buffer)
          end,
        },
      },
    },
    dependencies = {
      "marilari88/twoslash-queries.nvim",
    },
  },
  -- {
  --   "marilari88/twoslash-queries.nvim",
  --   event = "LspAttach",
  --   keys = { "<C-kk>", "<cmd>TwoslashQueriesInspect<cr>", mode = { "n" }, desc = "Inspect twoslash queries" },
  --   config = function()
  --     require("lazyvim.util.lsp").on_attach(function(client, buffer)
  --       require("twoslash-queries").attach(client, buffer)
  --     end)
  --   end,
  -- },
}
