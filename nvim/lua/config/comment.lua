-- https://github.com/numToStr/Comment.nvim

local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    print("Failed to load plugin: `numToStr/Comment.nvim`.")
    return
end

comment.setup()
