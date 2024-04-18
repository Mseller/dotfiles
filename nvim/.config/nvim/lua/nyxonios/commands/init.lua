vim.api.nvim_create_user_command('Uuid', function()
  local handle = io.popen("uuidgen | tr '[:upper:]' '[:lower:]' | tr -d '\n'", 'r')
  if handle then
    local result = handle:read '*a'
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))

    -- Plus one in the column since I want to insert the same way a
    -- regular paste would.
    vim.api.nvim_buf_set_text(0, row - 1, col + 1, row - 1, col + 1, { result })
    vim.api.nvim_notify('Uuid: ' .. result, vim.log.levels.INFO, {})
  else
    vim.api.nvim_notify('Uuid: could not get handle', vim.log.levels.ERROR, {})
  end
end, { desc = 'Inserts a UUID at the current cursor position' })

-- character table string
vim.api.nvim_create_user_command('DecodeBase64File', function()
  local content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
  local text = table.concat(content, '\n')
  local decoded = Base64dec(text)
end, { desc = 'Decodes a base64 string' })

-- Utility functions

local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

-- Base64enc encodes a string as base64.
---@param data string
---@return string
function Base64enc(data)
  return (
    (data:gsub('.', function(x)
      local r, b = '', x:byte()
      for i = 8, 1, -1 do
        r = r .. (b % 2 ^ i - b % 2 ^ (i - 1) > 0 and '1' or '0')
      end
      return r
    end) .. '0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
      if #x < 6 then
        return ''
      end
      local c = 0
      for i = 1, 6 do
        c = c + (x:sub(i, i) == '1' and 2 ^ (6 - i) or 0)
      end
      return b:sub(c + 1, c + 1)
    end) .. ({ '', '==', '=' })[#data % 3 + 1]
  )
end

-- Base64dec decodes a string from base64 encoding.
---@param data string
---@return string
function Base64dec(data)
  data = string.gsub(data, '[^' .. b .. '=]', '')
  return (
    data
      :gsub('.', function(x)
        if x == '=' then
          return ''
        end
        local r, f = '', (b:find(x) - 1)
        for i = 6, 1, -1 do
          r = r .. (f % 2 ^ i - f % 2 ^ (i - 1) > 0 and '1' or '0')
        end
        return r
      end)
      :gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if #x ~= 8 then
          return ''
        end
        local c = 0
        for i = 1, 8 do
          c = c + (x:sub(i, i) == '1' and 2 ^ (8 - i) or 0)
        end
        return string.char(c)
      end)
  )
end
