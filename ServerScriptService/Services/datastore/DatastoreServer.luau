local m = {}

function m:init() -- my initilization process for the datastores.
	local DS = game:GetService("DataStoreService") -- gets the datastore service
	local sData = DS:GetDataStore("sData") -- gets the datastore we will be using
	game:GetService("Players").PlayerAdded:Connect(function(plr) -- when a player joins
		local leaderstats = Instance.new("Folder") -- creates the leaderstats folder
		leaderstats.Parent = plr -- parents it to the player
		leaderstats.Name = "leaderstats" -- names it leaderstats
		
		local strength = Instance.new("IntValue") -- creates the intValue (Integer Value)
		strength.Name = "Strength" -- names it strength
		strength.Parent = leaderstats -- parents it to the leaderstats folder
		
		local success, data = pcall(function() -- protected calls the function with the variables sucess and data. Sucess is a boolean while data is an integer value (in my project)
			return sData:GetAsync(plr.UserId) -- uses the key for the player which is their user id
		end)
		
		if success and data ~= nil then -- if either is not equal to anything, either meaning the player hasnt played the game yet or some error in the datastore
			strength.Value = data -- sets the value to data which we defined before
		else 
			strength.Value = 0 -- if there is an error we just set their strength to 0
		end
		
	end)
	
	game:GetService("Players").PlayerRemoving:Connect(function(plr) -- now we actually set the datastore and we do this when the player leaves
		local err, data = pcall(function() -- again protected calls the function but instead of success i chose to use error
			return game:GetService("DataStoreService"):GetDataStore("sData"):SetAsync(plr.UserId, plr:WaitForChild("leaderstats").Strength.Value) -- I should have defined my leaderstats and datastores before but I was lazy. It anyway sets the data of sData to strength's value and uses the players user id as the key
		end)
	end)
end

return m
