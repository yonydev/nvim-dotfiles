-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Fast Enter
map("i", "jj", "<ESC>", { noremap = true, silent = true })

-- No Highlight
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { noremap = true, silent = true })

-- Two Slashes
map("n", "<C-k><C-k>", "<cmd>InspectTwoslashQueries<CR>", {})

-- Trouble
map(
  "n",
  "<leader>xr",
  "<cmd>Trouble lsp_references<CR>",
  { noremap = true, silent = true, desc = "References (Trouble)" }
)
map("n", "<leader>xg", "<cmd>TroubleToggle<CR>", { noremap = true, silent = true, desc = "Toggle (Trouble)" })

-- Gitsigns
map(
  "n",
  "<leader>ghk",
  "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<CR>",
  { noremap = true, silent = true, desc = "Prev Hunk" }
)
map(
  "n",
  "<leader>ghj",
  "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<CR>",
  { noremap = true, silent = true, desc = "Next Hunk" }
)
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { noremap = true, silent = true, desc = "Checkout branch" })

-- Bufferline
-- map("n", "<leader>bj", "<cmd>BufferLinePick<CR>", { noremap = true, desc = "Jump" })
-- map("n", "<leader>bf", "<cmd>Telescope buffers<CR>", { noremap = true, desc = "Find" })
-- map("n", "<leader>be", "<cmd>BufferLinePickClose<CR>", { noremap = true, desc = "Pick wich buffer to close" })
-- map("n", "<leader>bD", "<cmd>BufferLineSortByDirectory<CR>", { noremap = true, desc = "Sort by directory" })
