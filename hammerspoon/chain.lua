require "undo"

chain = (function(movements)
  local cycleLength = #movements
  local sequenceNumber = {}

  return function()
    local window = hs.window.focusedWindow()
    local key = window:id()
    if sequenceNumber[key] == nil then
      sequenceNumber[key] = 1
    end

    movements[sequenceNumber[key]](window)
    sequenceNumber[key] = sequenceNumber[key] % cycleLength + 1
  end
end)