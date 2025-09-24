-- this is a super simple script for checking duplicate part names. Again, easy scaleablility
local parts = {} -- my parts
local functions = {} -- my functions

function functions.initparts() -- new function. FINALLY NO PLAYER
	local seen = {} -- an array to find if we've seen the part before
	local WS = game:GetService("Workspace") -- defining workspace
	local partnumber = 1 -- how many duplicate parts there are. My variable naming needs work
	parts = WS.Parts:GetChildren() -- heres our part array in action. We are setting the part array to be all the children in this folder in the workspace
	for i, part in pairs(parts) do -- a loop going through each part
		if seen[part.Name] then -- if we've seen this same part name then we gotta DESTROY IT im just kidding
			part.Name = tostring(partnumber) -- we change the name to the part number. I told you it would come in handy
			partnumber = partnumber + 1		-- we add to the part number. whats the point if the part number NEVER CHANGES get the refrence? no? nevermind
		else
			seen[part.Name] = true -- we've seen this part. so add it to the list!
		end
	end
end

return functions -- BOOM we done with another one
