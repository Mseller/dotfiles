vim.opt.splitright = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.undofile = true
vim.opt.clipboard = 'unnamedplus'

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.o.termguicolors = true

vim.opt.spelllang = 'en_us'
vim.opt.spell = true

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.hlsearch = true
vim.opt.scrolloff = 10

vim.filetype.add { extension = { templ = 'templ' } }
