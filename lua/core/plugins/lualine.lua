-- Safely attempt to get user configuration
local user_conf = {}

if vim.g.config and vim.g.config.plugins and vim.g.config.plugins.lualine then
  user_conf = vim.g.config.plugins.lualine
end

local default_options = {
  extensions = vim.g.config and vim.g.config.plugins and vim.g.config.plugins.lualine and vim.g.config.plugins.lualine.extensions,
  options = {
    disabled_filetypes = { "alpha", "dashboard", "neo-tree" },
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
  },
  sections = {
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = {
      {
        "filename",
        file_status = true,
        newfile_status = true,
        path = 3,
      },
    },
    lualine_x = { "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
}

local function default_config_function(opts)
  -- Your existing configuration code...

  -- Finally, set up lualine
  require("lualine").setup(opts)
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = vim.tbl_deep_extend("force", default_options, (user_conf.opts or {})),
  config = function(_, opts)
    (user_conf.config_function or default_config_function)(opts)
  end,
}

