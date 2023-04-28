return {
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "window left" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "window right" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "window up" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "window down" },
    },
  },
}
