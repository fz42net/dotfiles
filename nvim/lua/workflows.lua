--
-- Obsidian
--

-- Navigating to and within our vault
vim.keymap.set("n", "<leader>oo", ":cd /Users/joe/Documents/Obsidian\\ Vault<cr>")

vim.keymap.set("n", "<leader>ot", ":ObsidianToday<cr>", { desc = "Obsidian Today" })
vim.keymap.set("n", "<leader>op", ":ObsidianYesterday<cr>", { desc = "Obsidian Yesterday" })
vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<cr>", { desc = "Obsidian Backlinks" })

-- Creating a new note workflow
vim.keymap.set("n", "<leader>on", ":ObsidianTemplate Assets/Templates/New Note Template.md<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")
vim.keymap.set("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>")

-- Searching for notes in our vault
vim.keymap.set("n", "<leader>os", ":Telescope find_files search_dirs={\"/Users/joe/Documents/Obsidian\\ Vault\"}<cr>")
vim.keymap.set("n", "<leader>oz", ":Telescope live_grep search_dirs={\"/Users/joe/Documents/Obsidian\\ Vault\"}<cr>")

-- Performing our weekly review
-- move file in current buffer to zettelkasten folder
--vim.keymap.set("n", "<leader>ok", ":!mv '%:p' /Users/joe/Documents/Obsidian\\ Vault\zettlekasten<cr>:bd<cr>")
-- delete file in current buffer
vim.keymap.set("n", "<leader>odd", ":!rm '%:p'<cr>:bd<cr>")




