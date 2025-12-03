return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    flavour = "mocha",
    config = function()
      require("catppuccin").setup({})
    end,
    opts = {},
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
