local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup({
  defaults = {
    file_ignore_patterns = { "node_modules", ".git" },
    prompt_prefix = "🔍 ",
    path_display = { "truncate" },
    -- Optional: disable preview for directories
    preview = {
      hide_on_startup = true,
    },
  },
  pickers = {
    find_files = {
      -- use fd to find files only
      find_command = { "fd", "--type", "f", "--hidden", "--follow" },
    },
    git_files = {
      show_untracked = true,
    },
  },
})

-- Find files using git_files, fallback to find_files
vim.keymap.set('n', '<leader>pf', function()
  local ok = pcall(builtin.git_files, { show_untracked = true })
  if not ok then
    builtin.find_files({
      hidden = true,
      no_ignore = true,
      find_command = { "fd", "--type", "f", "--hidden", "--follow" },
    })
  end
end, { desc = "Find Files (rg + git fallback)" })

-- Grep string under cursor or user input
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep String (rg)" })

vim.keymap.set('n', '<leader>pws', function()
  local word = vim.fn.expand("<cword>")
  builtin.grep_string({ search = word })
end, { desc = "Grep Current Word" })

vim.keymap.set('n', '<leader>pWs', function()
  local word = vim.fn.expand("<cWORD>")
  builtin.grep_string({ search = word })
end, { desc = "Grep Current WORD" })

-- Git files only
vim.keymap.set('n', '<C-p>', function()
  builtin.git_files({ show_untracked = true })
end, { desc = "Git Files" })
