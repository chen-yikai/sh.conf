return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })
    --- setup telescope fot jumping to todo comments
    todo_comments.setup({
      signs = true,
      keywords = {
        FIX = { icon = "", color = "error" },
        fix = { icon = "", color = "error" },
        TODO = { icon = "", color = "info" },
        todo = { icon = "", color = "info" },
        WARN = { icon = "", color = "warning" },
        warn = { icon = "", color = "warning" },
        NOTE = { icon = "", color = "hint" },
        note = { icon = "", color = "hint" },
      },
    })
    vim.keymap.set("n", "<leader>fd", "<cmd>TodoTelescope<CR>")
    -- vim.keymap.set("n", "<leader>fd", "<cmd>TodoLoc<CR>")
  end,
}
