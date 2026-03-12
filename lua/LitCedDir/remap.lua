vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "go back to directory" })

--set the cursor to the middle when scrolling down and up
--commented them so neonvim dont find confusion
-- vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "keep cursor in the middle when scolling Down"})
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "keep cursor in the middle when scolling Up"})

--set the cursor to the middle when searching

vim.keymap.set("n", "n", "nzzzv", { desc = "Set the cursor to the middle when searching" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Set the cursor to the middle when searching" })

--for saving the current copied into the system

vim.keymap.set("n", "<leader>y", '"+y', { desc = "Copy selected text into system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy selected text into system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Copy selected text into system clipboard" })

--for pasting from the system clipboard

vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })

--setting the esc key to be the jk combination for faster switch to normal mode

vim.keymap.set("i", "jk", "<Esc>", { desc = "the new way to go to normal mode when in insert mode" })

-- set the command line to be ; only instead to be shift + ;

vim.keymap.set("n", ";", ":", { desc = "Enter command mode with semicolon" })

vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlight" })

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")

-- this is for saving the files

vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true })

-- quit vim
vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true })

-- remaping the buffer selections so it dont open random files anymore

vim.keymap.set("n", "<C-o>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<C-i>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })

-- format the whole file
vim.keymap.set("n", "<leader>ri", "gg=G<C-o>", { desc = "Reindent entire file" })

--split tab
vim.keymap.set("n", "ss", ":split<Return>", { noremap = true, silent = true })
vim.keymap.set("n", "sv", ":vsplit<Return>", { noremap = true, silent = true })

--move window
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")
vim.keymap.set("n", "sx", "<C-w>q", { noremap = true, silent = true, desc = "Close window" })

--Resize Window
vim.keymap.set("n", "<C-w><left>", "<C-w><")
vim.keymap.set("n", "<C-w><right>", "<C-w>>")
vim.keymap.set("n", "<C-w><up>", "<C-w>+")
vim.keymap.set("n", "<C-w><down>", "<C-w>-")
