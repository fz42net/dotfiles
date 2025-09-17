local P = require("profile")

return {
  -- always
  { "tpope/vim-surround" },
  { "tpope/vim-commentary" },

  -- treesitter: lean vs full
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = P.is_work()
        and { "lua", "bash", "vim", "json", "yaml", "markdown" }
        or  { "lua","bash","vim","json","yaml","markdown","python","go","rust",
              "typescript","tsx","html","css","dockerfile","sql" },
      highlight = { enable = true },
    }
  },

  -- mason for tools
  { "williamboman/mason.nvim", config = true },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = P.is_work()
        and { "lua-language-server","bash-language-server","stylua","shfmt","yaml-language-server" }
        or  { "lua-language-server","bash-language-server","pyright","gopls","rust-analyzer",
              "typescript-language-server","eslint_d","prettier","black","ruff",
              "stylua","shfmt","yaml-language-server","dockerfile-language-server","sqlfluff" },
      run_on_start = true,
    }
  },

  -- lspconfig (select servers)
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lsp = require("lspconfig")
      local servers = { "lua_ls","bashls","yamlls" }
      if P.is_personal() then
        vim.list_extend(servers, { "pyright","gopls","rust_analyzer","tsserver","eslint","dockerls","sqlls" })
      end
      for _, s in ipairs(servers) do pcall(lsp[s].setup, {}) end
    end
  },

  -- personal-only productivity
  { "nvim-telescope/telescope.nvim", cond = P.is_personal(), dependencies = { "nvim-lua/plenary.nvim" } },
  { "folke/trouble.nvim", cond = P.is_personal() },
  { "lewis6991/gitsigns.nvim", cond = P.is_personal(), config = true },
  { "hrsh7th/nvim-cmp", cond = P.is_personal(), dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip" } },
}