local status, configs = pcall(require, "nvim-treesitter.configs")
if not status then return end

configs.setup({
  ensure_installed = {
    "vimdoc",
    "javascript",
    "typescript",
    "c",
    "lua",
    "rust",
    "html",
    "css",
    "php",
    "json",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
