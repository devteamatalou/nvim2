vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    callback = function()
        if vim.bo.modified and vim.bo.buftype == "" then
            vim.cmd("write")
            -- This prints the message at the bottom
            print("Saved!!!")

            -- Optional: Clear the message after 1 second so it doesn't stay there
            vim.defer_fn(function()
                vim.cmd("echo ''")
            end, 1000)
        end
    end,
})
