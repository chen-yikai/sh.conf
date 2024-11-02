return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local fb_actions = require("telescope._extensions.file_browser.actions")
    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules/", ".idea/", ".vscode/", ".DS_Store", "src/lib/components/ui/" },
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<A-k>"] = actions.move_selection_previous, -- move to prev result
            ["<A-j>"] = actions.move_selection_next, -- move to next result
            ["<A-l>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      extensions = {
        file_browser = {
          theme = "dropdown",
          cwd_to_path = true,
          mappings = {
            ["n"] = {
              ["h"] = fb_actions.goto_parent_dir,
            },
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")
    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    -- keymap.set("n", "<leader>ee", "<cmd>Telescope file_browser initial_mode=normal path=%:p:h select_buffer=true<cr>")
    keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find git files" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "help_tags" })
  end,
}
