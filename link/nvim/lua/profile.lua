local M = {}

-- Default to personal unless overridden
M.profile = vim.env.NVIM_PROFILE or "personal"

function M.is_work() return M.profile == "work" end
function M.is_personal() return M.profile == "personal" end

return M