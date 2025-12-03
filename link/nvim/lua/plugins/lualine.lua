return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- We don't need to see the time in lualine
      opts.sections.lualine_z = {}
    end,
  },
}
