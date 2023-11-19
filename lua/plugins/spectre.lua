return {
  {
    "nvim-pack/nvim-spectre",
    keys = function()
      return {
        { "<leader>Sr", "<cmd>lua require('spectre').open()<cr>", desc = "Replace in Files (Spectre)" },
        { "<leader>Sw", "<cmd>lua require('spectre').open()<cr>", desc = "Replace Word (Spectre)" },
        { "<leader>Sb", "<cmd>lua require('spectre').open_file_search()<cr>", desc = "Replace in Buffer (Spectre)" },
        {
          "<leader>Ss",
          [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
          desc = "Replace Cursor Word (Spectre)",
        },
      }
    end,
  },
}
