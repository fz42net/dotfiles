local P = require("profile")
return {
  { "tpope/vim-surround" },
  { "tpope/vim-commentary" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = P.is_work()
        and { "lua", "bash", "vim", "json", "yaml", "markdown" }
        or  { "lua","bash","vim","json","yaml","markdown","python","go","rust","typescript","tsx","html","css","dockerfile","sql" },
      highlight = { enable = true },
    },
  },
  { "williamboman/mason.nvim", config = true },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = P.is_work()
        and { "lua-language-server","bash-language-server","stylua","shfmt","yaml-language-server" }
        or  { "lua-language-server","bash-language-server","pyright","gopls","rust-analyzer","typescript-language-server","eslint_d","prettier","black","ruff","stylua","shfmt","yaml-language-server","dockerfile-language-server","sqlfluff" },
      run_on_start = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lsp = require("lspconfig")
      local core = { "lua_ls","bashls","yamlls" }
      local extra = { "pyright","gopls","rust_analyzer","tsserver","eslint","dockerls","sqlls" }
      local servers = core
      if P.is_personal() then for _,s in ipairs(extra) do table.insert(servers, s) end end
      for _, s in ipairs(servers) do pcall(lsp[s].setup, {}) end
    end
  },
}