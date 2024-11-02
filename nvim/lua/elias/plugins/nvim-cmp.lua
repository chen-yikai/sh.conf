return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = {
          border = "rounded", -- Set rounded borders
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:PurpleBorder", -- Set FloatBorder to a custom highlight group
        },
        documentation = {
          border = "rounded", -- Set rounded borders for documentation
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:PurpleBorder", -- Same for documentation
        },
      },
      mapping = cmp.mapping.preset.insert({
        ["<M-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<M-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<M-b>"] = cmp.mapping.scroll_docs(-4),
        ["<M-f>"] = cmp.mapping.scroll_docs(4),
        ["<M-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<M-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),
    })
    vim.cmd([[
  highlight PurpleBorder guifg=#cba6f7 guibg=NONE
]])
  end,
}
