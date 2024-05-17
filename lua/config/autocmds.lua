-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- vim.api.nvim_command("highlight Normal ctermbg=none guibg=none")
-- vim.api.nvim_create_autocmd("BufRead,BufNewFile", "*.txt", function()
--   vim.api.nvim_command("highlight Normal ctermbg=none guibg=none")
-- end)
-- function ColorMyPencils(color)
--   color = color or "dracula"
--   vim.cmd.colorscheme(color)
--
--   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end
--
-- ColorMyPencils()

-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "typescript", "typescriptreact", "typescript.tsx", "javascript.jsx", "go" },
  callback = function()
    vim.b.autoformat = false
  end,
})
