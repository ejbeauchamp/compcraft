local args = { ... }

if #args < 2 then
  print("Usage: mine <radius> <clockwise:true|false>");
  return;
end

local targetLength = tonumber(args[1]);
local turnLeft = args[2] == "true";

if turtle.getFuelCount() < targetLength*4+50 then
  print("Not enough fuel!");
  return;
end

local turnCount = 0;
while turnCount < 4 do

  local distanceCount = 1;
  while distanceCount < targetLength do
    if turtle.forward() then
      distanceCount = distanceCount + 1;
      print("forward!");
    else
      print("dig!");
      turtle.dig();
    end
  end

  turnCount = turnCount + 1;
  turtle.turnLeft();
  print("left!");
  
end

