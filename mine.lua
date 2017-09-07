local args = { ... }

if #args < 2 then
  print("Usage: mine <radius> <clockwise:true|false>");
  return;
end

local targetLength = tonumber(args[1]);
local turnLeft = args[2] == "true";

local turnCount = 0;
while turnCount < 4 do

  local distanceCount = 1;
  while distanceCount < targetLength do
    if turtle.forward() then
      distanceCount = distanceCount + 1;
    else
      turtle.dig();
    end
  end

  turnCount = turnCount + 1;
end

