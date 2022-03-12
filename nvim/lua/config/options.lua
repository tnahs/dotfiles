-- Returns a string of comma separated consecutive integers representing column
-- numbers. Used to fill the right half of a buffer with a color block instead
-- of a single like to represent the preferred column width.
local fill_columns = function(start, stop)
    local c = {}
    for i = start, stop do
        table.insert(c, i)
    end
    return table.concat(c, ",")
end

local options = {
    background = "dark",
    clipboard = "unnamedplus",
    cmdheight = 1,
    colorcolumn = fill_columns(81, 999),
    completeopt = {
        "menuone",
        "noselect",
    },
    cursorline = true,
    expandtab = true,
    fileencoding = "UTF-8",
    fillchars = {
        -- Renders window separators as:
        vert = "█",
        -- Removes tildes `~` at the end of files.
        eob = " ",
    },
    guifont = "JetBrains Mono NF",
    hlsearch = false,
    ignorecase = true,
    lazyredraw = true,
    linebreak = true,
    list = true,
    listchars = {
        -- Renders spaces as:
        space = "⋅",
        -- Renders tabs:
        tab = "▶  ",
    },
    mouse = "a",
    number = true,
    numberwidth = 4,
    pumheight = 15,
    relativenumber = true,
    scrolloff = 16,
    shiftwidth = 4,
    showmode = false,
    signcolumn = "yes",
    sidescroll = 0,
    smartcase = true,
    smartindent = true,
    spelllang = {
        "en_us",
    },
    spellsuggest = {
        "best",
        "10",
    },
    splitbelow = true,
    splitright = true,
    swapfile = false,
    tabstop = 4,
    termguicolors = true,
    undofile = true,
    updatetime = 250,
    wrap = false,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Treat `-` as part of a word when using `w` e.g. `this-is-one-word`.
vim.opt.iskeyword:append("-")

-- Suppress completion messages.
vim.opt.shortmess:append("c")

-- Highlight selection on yank.
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

-- Normalize tabbing.
-- BUG: This muddies the undo history.
-- vim.cmd([[
--   augroup Retab
--     autocmd!
--     autocmd BufWritePre * retab
--   augroup end
-- ]])

-- Don't insert the comment leader after hitting `o` or `O` in Normal mode.
-- https://vi.stackexchange.com/a/17739
vim.cmd([[
  augroup DisableCommentLeader
    autocmd!
    autocmd BufEnter * set formatoptions-=o
  augroup end
]])

-- Set the column count indicator color.
vim.cmd([[
  augroup LinkColorColumn
    autocmd!
    autocmd ColorScheme * highlight! link ColorColumn Cursorline
  augroup end
]])

-- Disable Vim's default `Todo` and `Error` syntax highlighting.
vim.cmd([[
  augroup LinkTodoError
    autocmd!
    autocmd VimEnter * highlight! link Todo Comment
    autocmd VimEnter * highlight! link Error Comment
  augroup end
]])
