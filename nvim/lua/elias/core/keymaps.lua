vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ww", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>we", "<cmd>q<CR>")
vim.keymap.set("n", "<leader>wt", "<cmd>qa<CR>")
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
-- toggle relative line numbers and line numbers
vim.keymap.set("n", "<leader>ll", ":set rnu!<CR>")
-- for undotree
vim.keymap.set("n", "<leader>uu", ":UndotreeToggle<CR>")
vim.keymap.set("n", "<leader>uf", ":UndotreeFocus<CR>")
-- :nohl
vim.keymap.set("n", "<leader>hl", ":nohl<CR>")

vim.cmd("highlight CustomYankHighlight guibg=#B83DFF guifg=#fff")
-- terminal
vim.keymap.set("n", "<M-Enter>", "<cmd>ToggleTerm<CR>")
vim.keymap.set("t", "<M-Enter>", "<cmd>ToggleTerm<CR>")
-- turn into normal mode in terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
-- split
vim.keymap.set("n", "<leader>sp", "<cmd>sp<CR>")
vim.keymap.set("n", "<leader>sv", "<cmd>vsp<CR>")
-- open reg
vim.keymap.set("n", "<leader>rg", "<cmd>registers<CR>")
-- equal split window width
vim.keymap.set("n", "<leader>me", "<cmd>wincmd=<CR>")
-- buffer key bind
vim.keymap.set("n", "<leader>bn", "<cmd>enew<CR>")
vim.keymap.set("n", "<leader>bl", "<cmd>bnext<CR>")
vim.keymap.set("n", "<leader>fa", "<cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>")
