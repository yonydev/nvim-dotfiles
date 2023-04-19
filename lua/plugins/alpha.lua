return {
  "goolord/alpha-nvim",
  opts = function()
    require("alpha")
    require("alpha.term")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
      dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
      dashboard.button("s", "勒" .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
      dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
      dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "AlphaShortcut"
    dashboard.section.buttons.opts.hl = "AlphaButtons"

    local width = 46
    local height = 25 -- two pixels per vertical space
    dashboard.section.terminal.command = "cat | " .. os.getenv("HOME") .. "/.dotfiles/art/this_is_fine.sh"
    dashboard.section.terminal.width = width
    dashboard.section.terminal.height = height
    dashboard.section.terminal.opts.redraw = true

    dashboard.section.header.val = "  𝕟 𝕖 𝕠 𝕧 𝕚 𝕞  "

    dashboard.config.layout = {
      { type = "padding", val = 1 },
      dashboard.section.terminal,
      { type = "padding", val = height + 5 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    return dashboard
  end,
}
