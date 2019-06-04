-- undo for window operations
undo = {}

function undo:push(window)
  local f = window:frame()
  local op = {id = window:id(), frame = window:frame()}
  table.insert(self, op)
end

function undo:pop()
  local op = table.remove(self)
  if op ~= nil then
    local window = hs.window.find(op.id)
    if window ~= nil then
      window:setFrame(op.frame)
    end
  end
end
