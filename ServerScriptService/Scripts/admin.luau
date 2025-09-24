local Players = game:GetService("Players") -- defines the playerservice

Players.PlayerAdded:Connect(function(plr) -- when the player joins
	plr.Chatted:Connect(function(message) -- checks for a message
		print(plr.Name .. " said: " .. message) -- just a print statement for the message and who said it
		local leaderstats = plr:FindFirstChild("leaderstats") -- defines leaderstats
		local strength = leaderstats:FindFirstChild("Strength") -- defines strength
		local args = string.split(message, " ") -- splits the string into 3 parts, a message, the seperator being the space(this is not stored), and the ammount I want to add to my strength
		local command = args[1]:lower() -- changes all of the first part to lowercase for easier detection
		local ammount = args[2] -- finds the ammount
			
		strength.Value = ammount -- sets the value of the strength to the ammount
	end)
end)
