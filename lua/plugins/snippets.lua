local file_exists = function(name)
  local f = io.open(name, 'r')
  return f ~= nil and io.close(f)
end

local dir = os.getenv 'HOME' .. '/.snippets/snippets.lua'

if file_exists(dir) then
  dofile(dir)
end

return {}
