return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {},
      },
    },
  },
  {
    "marilari88/twoslash-queries.nvim",
    event = "LspAttach",
    keys = { "<C-kk>", "<cmd>InspectTwoslashQueries<cr>", desc = "Inspect twoslash queries" },
    config = function()
      require("lazyvim.util").on_attach(function(client, buffer)
        require("twoslash-queries").attach(client, buffer)
      end)
    end,
  },
}
