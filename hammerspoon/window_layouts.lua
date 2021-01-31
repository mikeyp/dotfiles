-------------------------------------------------------------------------------
-- Utilities
-------------------------------------------------------------------------------

function getLeftScreen()
  return hs.screen.allScreens()[1]
end

function getRightScreen()
  if (hs.screen.allScreens()[3] ~= nil) then
    return hs.screen.allScreens()[3]
  elseif (hs.screen.allScreens()[2] ~= nil) then
    return hs.screen.allScreens()[2]
  else
    return hs.screen.allScreens()[1]
  end
end

function getThirdScreen()
  if (hs.screen.allScreens()[3] ~= nil) then
    return hs.screen.allScreens()[2]  else
    return hs.screen.allScreens()[3]
  end
end

-------------------------------------------------------------------------------
-- Left screen
-------------------------------------------------------------------------------
function getLeftLeftHalfRect()
  local screen = getLeftScreen()
  local max = screen:frame()
  local frame = hs.geometry.rect(max.x, max.y, max.w/2, max.h)
  return frame
end

function leftLeftHalf(window)
  undo:push(window)
  window:setFrame(getLeftLeftHalfRect())
end

function getLeftRightHalfRect()
  local screen = getLeftScreen()
  local max = screen:frame()
  local frame = hs.geometry.rect(max.x + max.w/2, max.y, max.w/2, max.h)
  return frame
end

function leftRightHalf(window)
  undo:push(window)
  window:setFrame(getLeftRightHalfRect())
end

function getLeftBottomLeftRect()
  local screen = getLeftScreen()
  local max = screen:frame()
  local frame = hs.geometry.rect(max.x, max.y + max.h/2, max.w/2, max.h/2)
  return frame
end

function leftBottomLeft(window)
  undo:push(window)
  window:setFrame(getLeftBottomLeftRect())
end

-------------------------------------------------------------------------------
-- Right screen
-------------------------------------------------------------------------------
function getRightLeftHalfRect()
  local screen = getRightScreen()
  local max = screen:frame()
  local frame = hs.geometry.rect(max.x, max.y, max.w/2, max.h)
  return frame
end

function rightLeftHalf(window)
  undo:push(window)
  window:setFrame(getRightLeftHalfRect())
end

function getRightRightHalfRect()
  local screen = getRightScreen()
  local max = screen:frame()
  local frame = hs.geometry.rect(max.x + max.w/2, max.y, max.w/2, max.h)
  return frame
end

function rightRightHalf(window)
  undo:push(window)
  window:setFrame(getRightRightHalfRect())
end

-------------------------------------------------------------------------------
-- Third screen
-------------------------------------------------------------------------------
function getThirdLeftHalfRect()
  local screen = getThirdScreen()
  local max = screen:frame()
  local frame = hs.geometry.rect(max.x, max.y, max.w/2, max.h)
  return frame
end

function thirdLeftHalf(window)
  undo:push(window)
  window:setFrame(getThirdLeftHalfRect())
end

function getThirdRightHalfRect()
  local screen = getThirdScreen()
  local max = screen:frame()
  local frame = hs.geometry.rect(max.x + max.w/2, max.y, max.w/2, max.h)
  return frame
end

function thirdRightHalf(window)
  undo:push(window)
  window:setFrame(getThirdRightHalfRect())
end


-------------------------------------------------------------------------------
-- Specific apps
-------------------------------------------------------------------------------

-- PHPStorm
function getRightLeftFourSeventhsRect()
  local screen = getRightScreen()
  local max = screen:frame()
  local frame = hs.geometry.rect(max.x, max.y, max.w * .5714, max.h)
  return frame
end

function rightLeftFourSevenths(window)
  undo:push(window)
  window:setFrame(getRightLeftFourSeventhsRect())
end

-- Terminal
function getRightRightThreeSeventhsRect()
  local screen = getRightScreen()
  local max = screen:frame()
  local frame = hs.geometry.rect(max.x + (max.w * .5714), max.y, max.w * .4285, max.h)
  return frame
end


function rightRightThreeSevenths(window)
  undo:push(window)
  window:setFrame(getRightRightThreeSeventhsRect())
end

-- Full screen
function getFullScreenRect(window)
  local screen = window:screen()
  local max = screen:frame()
  local frame = hs.geometry.rect(max.x, max.y, max.w, max.h)
  return frame
end

function fullScreen(window)
  undo:push(window)
  window:setFrame(getFullScreenRect(window))
end

-------------------------------------------------------------------------------
-- Layouts
-------------------------------------------------------------------------------

layout1 = {
  {"Safari", nil, getLeftScreen(), nil, getLeftRightHalfRect(), nil},
  {"Slack", nil, getLeftScreen(), nil, getLeftLeftHalfRect(), nil},
  {"Hammerspoon", nil, getLeftScreen(), nil, getLeftLeftHalfRect(), nil},
  {"iTerm2", nil, getRightScreen(), nil, getRightRightThreeSeventhsRect(), nil},
  {"PhpStorm", nil, getRightScreen(), nil, getRightLeftFourSeventhsRect(), nil},
  {"Spotify", nil, getLeftScreen(), nil, getLeftBottomLeftRect(), nil},
  {"Code", nil, getRightScreen(), nil, getRightLeftFourSeventhsRect(), nil},
  {"Mail", nil, getRightScreen(), nil, getRightLeftFourSeventhsRect(), nil},
  {"Mailplane", nil, getRightScreen(), nil, getRightLeftFourSeventhsRect(), nil},
}