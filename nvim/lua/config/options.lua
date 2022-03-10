-- Returns a string of comma separated consecutive integers representing column
-- numbers. Used to fill the right half of a buffer with a color block insted
-- of a single like to represent the preferred column width.
local fill_columns = function(start, stop)
    local c = {}
    for i = start, stop do
        table.insert(c, i)
    end
    return table.concat(c, ",")
end

local options = {
    swapfile = false,
    background = "dark",
    clipboard = "unnamedplus",
    cmdheight = 1,
    colorcolumn = { "81" }, -- fill_columns(81, 999),
    completeopt = { "menuone", "noselect" },
    cursorline = true,
    expandtab = true,
    fileencoding = "UTF-8",
    guifont = "JetBrains Mono NF",
    hlsearch = false,
    ignorecase = true,
    lazyredraw = true,
    linebreak = true,
    mouse = "a",
    number = true,
    pumheight = 15,
    scrolloff = 8,
    shiftwidth = 4,
    showmode = false,
    sidescrolloff = 8,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    tabstop = 4,
    termguicolors = true,
    undofile = true,
    updatetime = 1000,
    wrap = false,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Treat `-` as part of a word when using `w` e.g. `this-is-one-word`.
vim.opt.iskeyword:append("-")

vim.opt.shortmess:append("c")

vim.opt.fillchars = {
    -- Removes pipes | seperators on splits.
    vert = "█",
    -- Removes tildas ~ at the end of files.
    eob = " ",
}

-- Disable Vim's default `Todo` and `Error` syntax highlighting.
vim.cmd([[
  augroup DisableSyntax
    autocmd VimEnter * highlight clear Todo
    autocmd VimEnter * highlight link Todo Comment
    autocmd VimEnter * highlight clear Error
    autocmd VimEnter * highlight link Error Comment
  augroup end
]])

-- Highlight selection on yank.
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])
