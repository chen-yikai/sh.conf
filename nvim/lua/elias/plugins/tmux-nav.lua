return {
  "alexghergh/nvim-tmux-navigation",
  config = function()
 local nvim_tmux_nav = require('nvim-tmux-navigation')

        nvim_tmux_nav.setup {
            disable_when_zoomed = true -- defaults to false
        }
        -- format with alt key
        vim.keymap.set('n', "<A-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
        vim.keymap.set('n', "<A-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
        vim.keymap.set('n', "<A-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
        vim.keymap.set('n', "<A-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
        vim.keymap.set('n', "<A-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
        vim.keymap.set('n', "<A-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
        -- -- format with control key
        -- vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
        -- vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
        -- vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
        -- vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
        -- vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
        -- vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
  end
}
