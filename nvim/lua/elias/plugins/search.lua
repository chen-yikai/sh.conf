return {
  "nvim-pack/nvim-spectre",
  "nvim-lua/plenary.nvim",
  config = function()
    require("spectre").setup()

    vim.keymap.set("n", "<leader>y", '<cmd>lua require("spectre").toggle()<CR>', {
      desc = "Toggle Spectre",
    })
    vim.keymap.set("n", "<leader>pw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
      desc = "Search current word",
    })
    -- vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    --   desc = "Search current word",
    -- })
    vim.keymap.set("n", "<leader>pp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
      desc = "Search on current file",
    })
  end,
}
