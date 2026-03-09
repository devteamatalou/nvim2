local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Banner / Logo
dashboard.section.header.val = {
	" /$$    /$$ /$$           /$$    /$$$$$$$$                 /$$              /$$$$$$ /$$$$$$$  /$$$$$$$$      ",
	"| $$   | $$|__/          | $$   |__  $$__/                | $/             |_  $$_/| $$__  $$| $$_____/      ",
	"| $$   | $$ /$$  /$$$$$$$| $$   /$$| $$  /$$$$$$   /$$$$$$|_//$$$$$$$        | $$  | $$  \\ $$| $$            ",
	"|  $$ / $$/| $$ /$$_____/| $$  /$$/| $$ /$$__  $$ /$$__  $$ /$$_____/        | $$  | $$  | $$| $$$$$         ",
	" \\  $$ $$/ | $$| $$      | $$$$$$/ | $$| $$  \\ $$| $$  \\__/|  $$$$$$         | $$  | $$  | $$| $$__/         ",
	"  \\  $$$/  | $$| $$      | $$_  $$ | $$| $$  | $$| $$       \\____  $$        | $$  | $$  | $$| $$            ",
	"   \\  $/   | $$|  $$$$$$$| $$ \\  $$| $$|  $$$$$$/| $$       /$$$$$$$/       /$$$$$$| $$$$$$$/| $$$$$$$$      ",
	"    \\_/    |__/ \\_______/|__/  \\__/|__/ \\______/ |__/      |_______/       |______/|_______/ |________/      ",
}

-- Buttons
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
	dashboard.button("n", "  New File", ":ene <BAR> startinsert<CR>"),
	dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
	dashboard.button("t", "  Find Text", ":Telescope live_grep<CR>"),
	dashboard.button("p", "  Projects", ":Telescope projects<CR>"),
	dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
}

-- Highlight
dashboard.section.header.opts.hl = "Type"
dashboard.section.buttons.opts.hl = "Function"

-- Center vertically
local fn = vim.fn
local header_lines = #dashboard.section.header.val
local buttons_lines = #dashboard.section.buttons.val
local total_lines = header_lines + buttons_lines
local win_height = fn.winheight(0)
local top_padding = math.max(2, math.floor((win_height - total_lines) / 2))
dashboard.opts.layout[1].val = top_padding

alpha.setup(dashboard.opts)
