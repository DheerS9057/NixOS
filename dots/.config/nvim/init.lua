require("config.options")
require("config.lazy")
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
require("colorizer").setup()
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*hypr/*.conf", "hyprland.conf", "hypr*.conf" },
  callback = function()
    vim.bo.filetype = "hyprlang"
  end,
})





