local datastoreModule = require(script.Parent.Parent.Services.datastore.DatastoreServer) -- the path of my datastoremodule. This isnt needed, I could have done it in a serverscript for for easier scalabliltiy i chose a modulescript
local partManagerModule = require(script.Parent.Parent.Services.lift.serverLift.partManager) -- the path of my partManager. This module makes sure there are no named duplicates before its parsed through to the next module
local main = require(script.Parent.Parent.Services.lift.serverLift) -- the path of my main module. This one is where the brunt of the scripting occurs, where it determines if a player can pick up a part



local plrs = game:GetService("Players").PlayerAdded:Connect(function(plr) -- when a player is added into the game this will happen
	main.check(plr) -- we parse the player through the modulescript
end)
datastoreModule:init() -- this is my initialization process for datastoring
partManagerModule.initparts() -- this is making there arent any duplicates

