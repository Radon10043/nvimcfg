return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, 
    config = function(_, opts)
      require("onedarkpro").setup(opts)
      vim.cmd("colorscheme onedark")
    end,
  },
}
