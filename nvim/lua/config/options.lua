local options = {
    -- backup = false,
    -- swapfile = false,
    background = "dark",
    clipboard = "unnamedplus",
    cmdheight = 2,
    colorcolumn = { "80", "100" },
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

-- Highlight selection on yank.
vim.cmd(
    [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
    false
)
