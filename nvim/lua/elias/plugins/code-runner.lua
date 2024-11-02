return {
  "CRAG666/code_runner.nvim",
  config = function()
    require("code_runner").setup({
      float = {
        border = "rounded",
      },
      filetype = {
        java = {
          "cd $dir &&",
          "java $fileName",
        },
        python = {
          "cd $dir &&",
          "python $fileName",
        },
        rust = {
          "cd $dir &&",
          "rustc $fileName &&",
          "$dir/$fileNameWithoutExt",
        },
      },
    })
    -- key bind
    vim.keymap.set("n", "<leader>rr", "<cmd>:RunCode<CR>", { noremap = true, silent = false })
  end,
}
