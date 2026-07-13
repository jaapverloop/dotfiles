return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      layout = {
        preview = false,
        border = "rounded",
      },
    },
  },
  keys = {
    -- Picker
    { "<leader>ff", function() Snacks.picker.files() end },
    { "<leader>fb", function() Snacks.picker.buffers() end },
    { "<leader>fl", function() Snacks.picker.loclist() end },
    { "<leader>fq", function() Snacks.picker.qflist() end },
    { "<leader>fm", function() Snacks.picker.marks() end },
    { "<leader>gl", function() Snacks.picker.lines() end },
    { "<leader>gb", function() Snacks.picker.grep_buffers() end },
    { "<leader>gg", function() Snacks.picker.grep() end },
    { "<leader>gw", function() Snacks.picker.grep_word() end, mode = { "n", "x" } },

    -- Terminal
    { "<leader>tt", function() Snacks.terminal.toggle() end },
    { "<leader>to", function() Snacks.terminal.open() end },
    { "<leader>tf", function() Snacks.terminal.focus() end },
  },
}
