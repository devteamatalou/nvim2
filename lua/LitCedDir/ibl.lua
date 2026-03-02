local ibl = require("ibl")

ibl.setup({
    indent = {
        char = "▎", -- You can use "│" or "▏" or "▎"
    },     
    scope = {
        enabled = true, -- Highlights the current code block you're in
        show_start = false,
        show_end = false,
        highlight = {"Function", "Label" }
    },
}) 
