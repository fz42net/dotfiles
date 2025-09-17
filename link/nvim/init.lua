local P = require("profile")
vim.o.number = true; vim.o.relativenumber = true
require("lazy").setup(require("plugins"), {
  lockfile = (P.is_work() and vim.fn.stdpath("state").."/lazy-lock.work.json")
          or (vim.fn.stdpath("state").."/lazy-lock.personal.json")
})