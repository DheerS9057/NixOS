-- lua/config/lazy.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- === Essentials ===
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", build = ":MasonUpdate" },
  { "williamboman/mason-lspconfig.nvim" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- === Theme ===
 {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      contrast = "hard",
      italic = { strings = false, comments = true },
      overrides = {
        Normal       = { bg = "none" },
        NormalNC     = { bg = "none" },
        NormalFloat  = { bg = "none" },
        FloatBorder  = { bg = "none" },
        SignColumn   = { bg = "none" },
        LineNr       = { bg = "none" },
        Folded       = { bg = "none" },
        VertSplit    = { bg = "none" },
        StatusLine   = { bg = "none" },
        StatusLineNC = { bg = "none" },
      },
    })
    vim.cmd("colorscheme gruvbox")

    -- Transparent background globally
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
  end,
},

  -- === UI Enhancements ===
{
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "gruvbox",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
    })
  end,
},


  { "nvim-tree/nvim-tree.lua", config = function()
      require("nvim-tree").setup()
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    end
  },

  -- === LazyVim ===
  { "folke/lazy.nvim" },
})

