local M = {}
M.profile = vim.env.NVIM_PROFILE or "work"
function M.is_work() return M.profile == "work" end
function M.is_personal() return M.profile == "personal" end
return M