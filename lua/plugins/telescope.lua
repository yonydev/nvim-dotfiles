return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-project.nvim",
      "nvim-telescope/telescope-media-files.nvim",
      "debugloop/telescope-undo.nvim",
      "ahmedkhalf/project.nvim",
      "cljoly/telescope-repo.nvim",
      "rishabhjain9191/telescope-monorepos",
      "ThePrimeagen/git-worktree.nvim",
      -- "stevearc/aerial.nvim",
      "AckslD/nvim-neoclip.lua",
      "camgraff/telescope-tmux.nvim",
    },
    cmd = "Telescope",
    keys = {
      { "<leader>fr", "<cmd>Telescope file_browser<cr>", desc = "Browser" },
      { "<leader>ps", "<cmd>Telescope repo list<cr>", desc = "Search" },
      {
        "<leader>pp",
        function()
          require("telescope").extensions.project.project({ display_type = "minimal" })
        end,
        desc = "List",
      },
      -- Telescope aerial
      -- { "<leader>vo", "<cmd>Telescope aerial<cr>", desc = "Outline" },
      -- Telescope Undotree
      { "<leader>U", "<cmd>Telescope undo<cr>", desc = "Undotree" },
      -- Telescope Neoclip
      { "<C-y>", "<cmd>Telescope neoclip<cr>", desc = "Neoclip" },
      -- Telescope tmux
      { "<leader>ts", "<cmd>Telescope tmux sessions<cr>", desc = "Tmux sessions" },
      { "<leader>tw", "<cmd>Telescope tmux windows<cr>", desc = "Tmux windows" },
      -- Telescope monorepo
      { "<leader>mr", "<cmd>Telescope monorepos<cr>", desc = "Monorepo" },
      -- Telescope git-worktree
      {
        "<leader>gw",
        "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
        desc = "Git worktree",
      },
      {
        "<leader>gW",
        "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
        desc = "Create Git worktree",
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local actions_layout = require("telescope.actions.layout")
      local mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,
          ["?"] = actions_layout.toggle_preview,
        },
      }
      local opts = {
        pickers = {
          find_files = {
            theme = "dropdown",
            previewer = true,
            hidden = true,
            find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
          },
          git_files = {
            theme = "dropdown",
            previewer = false,
          },
          buffers = {
            theme = "dropdown",
            previewer = false,
          },
        },
        extensions = {
          file_browser = {
            theme = "dropdown",
            previewer = true,
            hijack_netrw = true,
            mappings = mappings,
          },
          project = {
            hidden_files = false,
            previewer = true,
            theme = "dropdown",
            sync_with_nvim_tree = true,
            base_dirs = {
              { "~/Sites" },
            },
            search_by = "title",
          },
          media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { "png", "webp", "jpg", "jpeg" },
            -- find command (defaults to `fd`)
            find_cmd = "rg",
          },
          undo = {
            side_by_side = true,
            layout_strategy = "horizontal",
            mappings = {
              i = {
                ["<cr>"] = require("telescope-undo.actions").yank_additions,
                ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                ["<C-cr>"] = require("telescope-undo.actions").restore,
              },
              n = {
                ["<cr>"] = require("telescope-undo.actions").yank_additions,
                ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                ["<C-cr>"] = require("telescope-undo.actions").restore,
              },
            },
          },
        },
      }
      telescope.setup(opts)
      telescope.load_extension("fzf")
      telescope.load_extension("project")
      telescope.load_extension("projects")
      telescope.load_extension("monorepos")
      -- telescope.load_extension("aerial")
      telescope.load_extension("media_files")
      telescope.load_extension("file_browser")
      telescope.load_extension("undo")
      telescope.load_extension("neoclip")
      telescope.load_extension("git_worktree")
      telescope.load_extension("tmux")
    end,
  },
  -- {
  --   "stevearc/aerial.nvim",
  --   config = true,
  -- },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern", "lsp" },
        patterns = { ".git" },
        ignore_lsp = { "null-ls" },
      })
    end,
  },
  {
    "AckslD/nvim-neoclip.lua",
    config = true,
  },
}
