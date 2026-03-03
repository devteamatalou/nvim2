vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = "go back to directory"})

--set the cursor to the middle when scrolling down and up
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "keep cursor in the middle when scolling Down"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "keep cursor in the middle when scolling Up"})

--set the cursor to the middle when searching 

vim.keymap.set("n", "n", "nzzzv", {desc = "Set the cursor to the middle when searching"})
vim.keymap.set("n", "N", "Nzzzv", {desc = "Set the cursor to the middle when searching"})

--for saving the current copied into the system

vim.keymap.set("n", "<leader>y", "\"+y", {desc = "Copy selected text into system clipboard"})
vim.keymap.set("v", "<leader>y", "\"+y", {desc = "Copy selected text into system clipboard"})
vim.keymap.set("n", "<leader>Y", "\"+Y", {desc = "Copy selected text into system clipboard"})


--for pasting from the system clipboard

vim.keymap.set("n", "<leader>p", "\"+p", {desc = "Paste from system clipboard"})

--setting the esc key to be the jk combination for faster switch to normal mode

vim.keymap.set("i", "jk", "<Esc>", {desc = "the new way to go to normal mode when in insert mode"})
