-- lua/plugins/telescope.lua
return {
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      telescope.setup({})
      pcall(telescope.load_extension, "fzf")

      local builtin = require("telescope.builtin")

      -- VSCode-ish command palette
      vim.keymap.set("n", "<C-S-P>", builtin.commands, { desc = "Command Palette" })

      -- Good fallback (many terminals can't distinguish Ctrl+Shift+P from Ctrl+P)
      vim.keymap.set({ "n", "i" }, "<C-p>", builtin.commands, { desc = "Command Palette (fallback)" })
    end,
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
}

