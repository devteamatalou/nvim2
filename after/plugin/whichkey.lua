require("which-key").setup({
   preset = "modern", -- This uses a cleaner, more compact look
   win = {
      border = "rounded", -- Adds nice curved corners
      position = "right", -- You can keep it bottom but...
      width = 1, -- 1 means 100% width, use 0.5 for half screen
   },
   layout = {
      align = "center", -- Centers the text inside the window
   }
})
