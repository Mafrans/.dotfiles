local lazy = require "lazy"
local cmpConfig = require "config.cmp"
local lspConfig = require "config.lsp"
local deviconsConfig = require "config.devicons"
local treesitterConfig = require "config.treesitter"
local signatureConfig = require "config.signature"

lazy.setup({
    {
        "neovim/nvim-lspconfig",
        config = lspConfig
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        config = signatureConfig,
    },
    { "hoob3rt/lualine.nvim" },
    { "preservim/nerdtree" },
    { "preservim/nerdcommenter" },
    { "Xuyuanp/nerdtree-git-plugin" },
    {
        "nvim-tree/nvim-web-devicons",
        config = deviconsConfig
    },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    {
        "hrsh7th/nvim-cmp",
        config = cmpConfig
    },
    { "nvarner/typst-lsp" },
    { "kaarmu/typst.vim",        ft = "typst", lazy = false },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    {
        "Mofiqul/dracula.nvim",
        lazy = false
    },
    { "folke/twilight.nvim" },
    { "norcalli/nvim-colorizer.lua" },
    { "sunjon/shade.nvim" },
    { "jghauser/mkdir.nvim" },
    { "romgrk/barbar.nvim" },
    { "moll/vim-bbye" },
    {
        "nvim-treesitter/nvim-treesitter",
        cmd = "TSUpdate",
        config = treesitterConfig
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    { "nvim-lua/plenary.nvim" },
    { "lewis6991/gitsigns.nvim" },
    { "nvim-telescope/telescope.nvim" },
    {
        "zbirenbaum/copilot.lua",
        event = { "VimEnter" },
    },
    {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua", "nvim-cmp" },
    }
})
