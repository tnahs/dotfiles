-- https://github.com/numToStr/Comment.nvim

local ok, comment = pcall(require, "Comment")
if not ok then
    print("Failed to load plugin: `numToStr/Comment.nvim`.")
    return
end

comment.setup({
    mappings = {
        basic = true,
    },
})
