-- https://github.com/numToStr/Comment.nvim

local ok, comment = pcall(require, "Comment")
if not ok then
    print("Failed to load plugin: `numToStr/Comment.nvim`.")
    return
end

comment.setup({
    -- -- LHS of toggle mappings in NORMAL + VISUAL mode
    -- toggler = {
    --     -- Line-comment toggle keymap
    --     line = "gcc",
    --     -- Block-comment toggle keymap
    --     block = "gbc",
    -- },
    --
    -- -- LHS of operator-pending mappings in NORMAL + VISUAL mode
    -- opleader = {
    --     -- Line-comment keymap
    --     line = "gc",
    --     -- Block-comment keymap
    --     block = "gb",
    -- },
    --
    -- -- LHS of extra mappings
    -- extra = {
    --     -- Add comment on the line above
    --     above = "gcO",
    --     -- Add comment on the line below
    --     below = "gco",
    --     -- Add comment at the end of line
    --     eol = "gcA",
    -- },
})
