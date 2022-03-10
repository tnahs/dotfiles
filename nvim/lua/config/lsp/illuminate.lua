-- https://github.com/RRethy/vim-illuminate

local opts = { noremap = true, silent = true }

M = {}
M.setup = function(client)
    local ok, illuminate = pcall(require, "illuminate")
    if not ok then
        print("Failed to load plugin: `RRethy/vim-illuminate`.")
        return
    end

    -- FIX: This should disable highlighting in `NvimTree`.
    vim.g.Illuminate_ftblacklist = { "NerdTree" }

    -- Cycle through highlights.
    vim.api.nvim_set_keymap("n", "<C-n>", ":lua require('illuminate').next_reference({ wrap = true })<CR>", opts)

    illuminate.on_attach(client)
end

return M
