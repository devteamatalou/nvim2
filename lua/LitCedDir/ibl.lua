local ibl = require("ibl")

ibl.setup({
    indent = {
        char = "▎", -- You can use "│" or "▏" or "▎"
    },     
    scope = {
        enabled = true, -- Highlights the current code block you're in
        show_start = true,
        show_end = true,
        highlight = {"Function", "Label" }
    },
}) 
