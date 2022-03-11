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
    numberwidth = 4,
    pumheight = 15,
    relativenumber = true,
    scrolloff = 8,
    shiftwidth = 4,
    showmode = false,
    sidescrolloff = 8,
    smartcase = true,
    smartindent = true,
    spelllang = { "en_us" },
    spellsuggest = { "best", "10" },
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
    -- Removes pipes | separators on splits.
    vert = "█",
    -- Removes tildes ~ at the end of files.
    eob = " ",
}

-- Highlight selection on yank.
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

-- Disable Vim's default `Todo` and `Error` syntax highlighting.
vim.cmd([[
  augroup DisableDefaultHighlights
    autocmd VimEnter * highlight clear Todo
    autocmd VimEnter * highlight link Todo Comment
    autocmd VimEnter * highlight clear Error
    autocmd VimEnter * highlight link Error Comment
  augroup end
]])
