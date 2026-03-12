vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25"
vim.opt.shortmess:append("sI")
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
-- Fixed Windows path error:
local undodir = (os.getenv("USERPROFILE") or os.getenv("HOME") or ".") .. "/.vim/undodir"
vim.fn.mkdir(undodir, "p") -- creates the directory if it doesn't exist
vim.opt.undodir = undodir
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = "no"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.list = false
-- Keep the command line height at 1 so it doesn't create extra space
vim.opt.cmdheight = 0
vim.opt.cmdwinheight = 1
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.ruler = false
vim.opt.cursorline = true
vim.opt.grepprg = "rg ----vimgrep"
vim.opt.timeoutlen = 300
vim.opt.autoindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"
vim.opt.formatoptions:append({ "r" })
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.backspace = { "start", "eol", "indent" }
