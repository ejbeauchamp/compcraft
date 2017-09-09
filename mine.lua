local args = { ... }

if #args < 2 then
  print("Usage: mine <radius> <turn:left|right>");
  return;
end

local targetLength = tonumber(args[1]);
local turnLeft = args[2] == "left";

if turtle.getFuelLevel() < targetLength*4+50 then
  print("Not enough fuel!");
  return;
end

-- Loop through each stretch
local turnCount = 0;
while turnCount < 4 do

  -- Loop through each block in the stretch
  local distanceCount = 1;
  while distanceCount < targetLength do

    -- Place an item behind us
    if distanceCount == 2 then
      turtle.turnLeft();
      turtle.turnLeft();
      turtle.place();
      turtle.turnLeft();
      turtle.turnLeft();
    end

    -- Check if we are nearly done
    if (distanceCount == targetLength - 1) and turnCount == 3 then
      turtle.digUp();
      turtle.place();
      return;
    end

    -- Try to move forward
    if turtle.forward() then
      distanceCount = distanceCount + 1;
      print("forward!");
    else
      -- Couldn't move forward, lets dig
      print("dig!");
      turtle.dig();
    end
  end

  -- Turn!
  turnCount = turnCount + 1;
  if turnLeft then
    turtle.turnLeft();
    print("left!");
  else
    turtle.turnLeft();
    print("right!");
  end
end

