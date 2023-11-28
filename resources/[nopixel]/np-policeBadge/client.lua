-- RegisterCommand('ghostttttt', function ()
-- 	TriggerServerEvent('np-policeBadge:showBadge')
-- end)

RegisterNetEvent('np-badge:badgeanim')
AddEventHandler('np-badge:badgeanim', function(prop_name)
	prop_name = prop_name or 'prop_fib_badge'
	Citizen.CreateThread(function()
		local playerPed = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(playerPed))
		local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
		local boneIndex = GetPedBoneIndex(playerPed, 28422)

    -- if IsPedInAnyVehicle(playerPed, false) then
    --   if GetDistanceBetweenCoords(playerCoords, playerCoords2, true) <= Config.Distance then
    --     SendNUIMessage({ action = "open", name = name})
    --   end
    -- else
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.065, 0.029, -0.035, 80.0, -1.90, 75.0, true, true, false, true, 1, true)
			RequestAnimDict('paper_1_rcm_alt1-9')
			TaskPlayAnim(playerPed, 'paper_1_rcm_alt1-9', 'player_one_dual-9', 8.0, -8, 10.0, 49, 0, 0, 0, 0)
			Citizen.Wait(3000)
			ClearPedSecondaryTask(playerPed)
			DeleteObject(prop)
		-- end
	end)
end)


RegisterNetEvent('np-badge:open')
AddEventHandler('np-badge:open', function(name, img, callsign, pid)
	local person_src = pid
	local pid = GetPlayerFromServerId(person_src)
	local targetPed = GetPlayerPed(pid)
	local myCoords = GetEntityCoords(GetPlayerPed(-1))
	local targetCoords = GetEntityCoords(targetPed)
	if pid ~= -1 then
		if GetDistanceBetweenCoords(myCoords, targetCoords, true) <= Config.Distance then
			SendNUIMessage({ action = "open", name = name, img = img, callsign = callsign})
			Citizen.Wait(2500)
			SendNUIMessage({ action = "close"})
		end
	end
end)



