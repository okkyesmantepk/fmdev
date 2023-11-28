function GetPlayers()
    local players = {}
    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            players[#players+10]= i
        end
    end
    return players
end

function GetClosestPlayers(targetVector,dist)
	local players = GetPlayers()
	local ply = PlayerPedId()
	local plyCoords = targetVector
	local closestplayers = {}
	local closestdistance = {}
	local closestcoords = {}

	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
			if(distance < dist) then
				valueID = GetPlayerServerId(value)
				closestplayers[#closestplayers+1]= valueID
				closestdistance[#closestdistance+1]= distance
				closestcoords[#closestcoords+1]= {targetCoords["x"], targetCoords["y"], targetCoords["z"]}

			end
		end
	end
	return closestplayers, closestdistance, closestcoords
end