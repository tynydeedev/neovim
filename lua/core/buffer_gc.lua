-- lua/core/buffer_gc.lua
local M = {}

local timeout_ms = 5 * 60 * 1000 -- 5 minutes
local timers = {}

local function is_valid(bufnr)
  return vim.api.nvim_buf_is_valid(bufnr)
      and vim.api.nvim_buf_is_loaded(bufnr)
      and not vim.bo[bufnr].modified  -- optional: skip unsaved
      and vim.bo[bufnr].buftype == "" -- only real files
end

local function buffer_is_visible(bufnr)
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_buf(win) == bufnr then
      return true
    end
  end
  return false
end

local function shutdown_unused_lsp_clients()
  for _, client in ipairs(vim.lsp.get_active_clients()) do
    local is_used = false
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
      if vim.lsp.buf_is_attached(bufnr, client.id) then
        is_used = true
        break
      end
    end
    if not is_used then
      client.stop()
      vim.notify("LSP client stopped: " .. client.name, vim.log.levels.INFO)
    end
  end
end

local function schedule_cleanup(bufnr)
  if timers[bufnr] then return end

  local timer = vim.loop.new_timer()
  timer:start(timeout_ms, 0, vim.schedule_wrap(function()
    if is_valid(bufnr) and not buffer_is_visible(bufnr) then
      vim.cmd("bdelete " .. bufnr)
      vim.notify("Buffer auto-deleted: " .. vim.api.nvim_buf_get_name(bufnr), vim.log.levels.INFO)
      shutdown_unused_lsp_clients()
    end
    if timers[bufnr] then
      timers[bufnr]:stop()
      timers[bufnr]:close()
      timers[bufnr] = nil
    end
  end))

  timers[bufnr] = timer
end

function M.setup()
  vim.api.nvim_create_autocmd("BufLeave", {
    callback = function(args)
      local bufnr = args.buf
      if is_valid(bufnr) then
        schedule_cleanup(bufnr)
      end
    end,
  })

  vim.api.nvim_create_autocmd("BufEnter", {
    callback = function(args)
      local bufnr = args.buf
      local timer = timers[bufnr]
      if timer then
        timer:stop()
        timer:close()
        timers[bufnr] = nil
      end
    end,
  })
end

return M
