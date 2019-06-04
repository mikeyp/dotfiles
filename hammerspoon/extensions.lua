require "fntools"
local pretty = require "pl.pretty"

function clear()
  hs.console.clearConsole()
end

function f(str)
  local outer_env = _ENV
  return (str:gsub("%b{}", function(block)
     local code = block:match("{(.*)}")
     local exp_env = {}
     setmetatable(exp_env, { __index = function(_, k)
        local stack_level = 5
        while debug.getinfo(stack_level, "") ~= nil do
           local i = 1
           repeat
              local name, value = debug.getlocal(stack_level, i)
              if name == k then
                 return value
              end
              i = i + 1
           until name == nil
           stack_level = stack_level + 1
        end
        return rawget(outer_env, k)
     end })
     local fn, err = load("return "..code, "expression `"..code.."`", "t", exp_env)
     if fn then
        return tostring(fn())
     else
        error(err, 0)
     end
  end))
end


---------------------------------------------------------
-- Debugging
---------------------------------------------------------

dbg = function(...)
  print(hs.inspect(...))
end

dbgf = function (...)
  return dbg(string.format(...))
end

function tap (a)
  dbg(a)
  return a
end

function dump(table)
  pretty.dump(table)
end

---------------------------------------------------------
-- Extension of native objects and modules
---------------------------------------------------------

-- Create a unique string for a window
-- @returns string
function hs.window:key()
  local applicationName = compose(
    getProperty("application"),
    getProperty("title")
  )(self)

  return string.format("%s:%s", applicationName, self:id())
end

function hs.window:isMaximized()
  local screen = self:screen()
  local screenFrame = screen:frame()

  return compareShallow(self:frame(), screenFrame)
end