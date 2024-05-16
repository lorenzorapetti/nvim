local M = {}

function M.is_darwin()
  return vim.loop.os_uname().sysname == 'Darwin'
end

function M.is_linux()
  return vim.loop.os_uname().sysname == 'Linux'
end

function M.is_xcode_project()
  return vim.fs.dirname(vim.fs.find({ 'buildServer.json' }, { upward = true })[1])
end

return M
