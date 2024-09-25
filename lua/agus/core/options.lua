local opt = vim.opt

opt.number = true
opt.relativenumber = true

vim.api.nvim_create_user_command("ToggleLineNumbersMode", function ()
    opt.relativenumber = not opt.relativenumber
end, { nargs = 0 })


-- Tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Dash in words
opt.iskeyword:append("-")
