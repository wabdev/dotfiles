vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  use({
	  "nvim-telescope/telescope.nvim", tag = "0.1.2",
	  requires = { {"nvim-lua/plenary.nvim"} }
  })

  use("folke/tokyonight.nvim")

  use({
	  "nvim-treesitter/nvim-treesitter",
	  run = function()
		  local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		  ts_update()
	  end,
  })

  use("theprimeagen/harpoon")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("jose-elias-alvarez/null-ls.nvim")

  use {
      "VonHeikemen/lsp-zero.nvim",
      branch = "v2.x",
      requires = {
          -- LSP Support
          {"neovim/nvim-lspconfig"},             -- Required
          {"williamboman/mason.nvim"},           -- Optional
          {"williamboman/mason-lspconfig.nvim"}, -- Optional

          -- Autocompletion
          {"hrsh7th/nvim-cmp"},     -- Required
          {"hrsh7th/cmp-nvim-lsp"}, -- Required
          {"L3MON4D3/LuaSnip"},     -- Required
      }
  }

  use ({
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            suggestion = {
                auto_trigger = true,
            }
        })
    end,
  })

end)
