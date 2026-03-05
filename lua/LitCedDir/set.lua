vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25"
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
-- Fixed Windows path error:
vim.opt.undodir = (os.getenv("USERPROFILE") or os.getenv("HOME") or ".") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.list = false
-- Keep the command line height at 1 so it doesn't create extra space
vim.opt.cmdheight = 1
vim.opt.showmode = false
vim.opt.ruler = false
