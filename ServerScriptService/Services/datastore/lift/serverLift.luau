local functions = {} -- makes my functions array

local parts = game:GetService("Workspace").Parts:GetChildren() -- theres a folder in workspace called parts with different parts of different sizes in it

function functions.checkliftable(plr) -- new function with the variable player YAY!
	local leaderstats = plr:WaitForChild("leaderstats") -- finding the leaderstats
	local strength = leaderstats:WaitForChild("Strength") -- same here
	while strength.Value == 0 do -- just making sure that strength finally parses
		wait(0.1) -- just a wait.
	end
	local liftable = Vector3.new(strength.Value,strength.Value,strength.Value) -- this is my logic for lifting. Yes i could have made it more complicated. but uhhh im again kind of lazy
	print(tostring(liftable)) -- just a print for debugging. Just in case
	return liftable -- returns the liftable variable for later use
end


function functions.check(plr) -- wowzer another function with the frickin player passed through. Who could have guessed
	local liftable = functions.checkliftable(plr) -- heres the function we did before
	for i, part in pairs(parts) do -- a loop checking through each part to see if its liftable
		local size = part.Size -- the part's size
		if  size.X <= liftable.X and size.Y <= liftable.Y and size.Z <= liftable.Z then -- you cant actually compare vector3 vars so i had to write this annoying line of code just compares the size of the part to what we can lift
			print(plr.Name, part.Name.."liftable") -- just a print. You can add alot more here
		else
			print(plr.Name, part.Name.."Not Liftable") -- again just a print.
		end
	end
	
end



return functions -- yipeee we're done with this one
