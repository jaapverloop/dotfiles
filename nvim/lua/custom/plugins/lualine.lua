return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin",
        icons_enabled = false,
        section_separators = "",
        component_separators = "┊",
      }
    })
  end,
}
