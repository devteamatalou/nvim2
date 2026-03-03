local status, autotag = pcall(require, "nvim-ts-autotag")
if not status then return end

autotag.setup({
  opts = {
    -- Enable auto-close and auto-rename
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = true,
  },
  -- This ensures it works in your specific filetypes
  per_filetype = {
    ["typescriptreact"] = {
      enable_close = true,
      enable_rename = true,
    },
    ["php"] = {
      enable_close = true,
      enable_rename = true,
    },
    ["html"] = {
      enable_close = true,
      enable_rename = true,
    }
  }
})
