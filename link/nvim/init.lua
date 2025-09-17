local P = require("profile")

-- shared opts
require("opts")

-- lightweight vs richer timing
vim.o.updatetime = P.is_work() and 750 or 300

-- Attempt to load private-but-safe overrides if present
pcall(require, "private")

-- Plugin manager (lazy.nvim assumed)
require("lazy").setup(require("plugins"), {
  lockfile = P.is_work()
    and (vim.fn.stdpath("state").."/lazy-lock.work.json")
     or (vim.fn.stdpath("state").."/lazy-lock.personal.json")
})