local status, lualine = pcall(require, "lualine")
if not status then return end

lualine.setup({
    options = {
        theme = 'auto', -- Automatically matches your current colorscheme
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        icons_enabled = true,
        globalstatus = true, -- One single statusline at the bottom instead of one per split
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } }, -- 'path = 1' shows the relative path (src/User.ts)
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    }
})
