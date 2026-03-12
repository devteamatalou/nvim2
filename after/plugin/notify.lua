local notify = require("notify")

notify.setup({
  -- "fade", "slide", "fade_in_slide_out", or "static"
  stages = "fade_in_slide_out",
  timeout = 3000,
  background_colour = "#000000", -- Matches most dark themes
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})

-- This line tells Neovim to use notify for all default print/echo messages
vim.notify = notify

-- Optional: Keybind to dismiss all active notifications
vim.keymap.set("n", "<leader>nd", function()
  notify.dismiss({ pending = true, silent = true })
end, { desc = "Dismiss Notifications" })
