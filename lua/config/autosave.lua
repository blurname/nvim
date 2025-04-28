
-- require("autosave").setup{
-- 	enabled = true,
-- 	execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
-- 	events = {"InsertLeave","TextChanged"},
-- 	conditions = {
-- 		exists = true,
-- 		filetype_is_not = {},
-- 		modifiable = true
-- 	},
-- 	write_all_buffers = false,
-- 	on_off_commands = true,
-- 	clean_command_line_interval = 2500
-- }
--
-- vim.api.nvim_create_autocmd("BufWritePost",{
--   callback = function()
--   end
-- })

---@type table<buffer, uv_timer_t>

local timers = {}

local timeout = 500
local autocmd = vim.api.nvim_create_autocmd



local function save(buf)
  vim.api.nvim_buf_call(buf, function() vim.cmd("noautocmd update") end)
end



autocmd({ "InsertLeave", "TextChanged" }, {
  group = augroup,
  desc = "Schedule auto-saving",
  callback = function(event)
    local bo = vim.bo[event.buf]
    if event.file == "" or bo.buftype ~= "" or bo.filetype == "gitcommit" or bo.readonly or not bo.modified then
      return
    end
    local timer = timers[event.buf]
    if timer then
      if timer:is_active() then timer:stop() end
    else
      timer = vim.uv.new_timer()
      timers[event.buf] = timer
    end
    timer:start(timeout, 0, vim.schedule_wrap(function() save(event.buf) end))
  end,
})

autocmd({ "FocusLost", "ExitPre", "TermEnter" }, {
  group = augroup,
  desc = "Save immediately",
  callback = function(event)
    for buf, timer in pairs(timers) do
      if timer:is_active() then
        timer:stop()
        save(buf)
      end
    end
  end,
})

autocmd({ "BufWritePost", "InsertEnter" }, {
  group = augroup,
  desc = "Cancel scheduled auto-saving",
  callback = function(event)
    local timer = timers[event.buf]
    if timer and timer:is_active() then timer:stop() end
  end,
})

autocmd({ "BufDelete" }, {
  group = augroup,
  desc = "Remove timer",
  callback = function(event)
    local timer = timers[event.buf]
    if timer then
      timers[event.buf] = nil
      if timer:is_active() then timer:stop() end
      timer:close()
    end
  end,
})

