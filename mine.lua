local args = { ... }

if #args < 2 then
  print("Usage: mine <radius> <clockwise:true|false>");
  return;
end

local targetLength = tonumber(args[0]);
local turnLeft = toboolean(args[1]);


local turnCount = 0;
while turnCount < 4 do

  local distanceCount = 1;
  while distanceCount < targetLength do
    if turtle.moveForward() then
      distanceCount = distanceCount + 1;
    else
      turtle.dig();
    end
  end
  turnCount = turnCount + 1;
end

