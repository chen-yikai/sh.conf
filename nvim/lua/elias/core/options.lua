vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.laststatus = 3
opt.relativenumber = false
opt.number = true
opt.showtabline = 0

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = true

opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true
opt.iskeyword:append("-")

-- opt.hlsearch = false
opt.incsearch = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.updatetime = 50
opt.colorcolumn = "80"
opt.scrolloff = 15

vim.filetype.add({
  pattern = { [".*/hyprland%.conf"] = "hyprlang" },
})

opt.colorcolumn = ""

-- Set splitright and splitbelow to avoid creating an additional split
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Define a custom highlight group for the vertical split border
vim.cmd("highlight VertSplit cterm=NONE ctermfg=NONE ctermbg=NONE guifg=#888888 guibg=NONE")

---- yank highlight
vim.cmd([[
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="CustomYankHighlight", timeout=100, on_visual=true})
    autocmd TextYankPost * if v:event.operator == 'y' && v:event.regname == '"' | silent! lua vim.highlight.on_yank({higroup="CustomYankHighlight", timeout=100, on_visual=true}) | endif
  augroup END
]])

-- i3 config
vim.cmd([[
  augroup i3config
    autocmd!
    autocmd BufNewFile,BufRead */.config/i3/* set filetype=i3config
  augroup END
]])
-- disable warning that doesn't matter
local function silence_warnings()
  vim.notify = function(msg, level, opts)
    if msg:match("vim.treesitter.get_parser will return nil") then
      return -- Ignore this specific warning
    end
    -- Call the original notify function for other messages
    require("notify")(msg, level, opts)
  end
end
silence_warnings()
