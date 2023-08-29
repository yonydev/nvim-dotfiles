return {
  {
    "mhanberg/output-panel.nvim",
    keys = {
      { "<leader>uo", "<cmd>OutputPanel<cr>", desc = "Toggle LSP output" },
    },
    config = function()
      require("output_panel").setup()
    end,
  },
}
