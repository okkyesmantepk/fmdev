Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("container_1", vector3(678.8, 1287.04, 360.47), 2, 2, {
        name="container_1",
        heading=0,
        minZ=357.87,
        maxZ=361.87
	})
end)

local pDoorUnlocked = false
local container_1 = false

RegisterNetEvent('np-doors:unlockContainer1')
AddEventHandler('np-doors:unlockContainer1', function()
    local distance = #(vector3(667.53198, 1287.033, 360.29592) - GetEntityCoords(PlayerPedId()))

    if exports['np-inventory']:hasEnoughOfItem('key1', 1) then
        if distance < 2 then
            if not pDoorUnlocked then
                pDoorUnlocked = true
                TriggerServerEvent('np-doors:change-lock-state', 721, false) 
                TriggerServerEvent('np-doors:change-lock-state', 720, false) 
            else
                pDoorUnlocked = false
                TriggerServerEvent('np-doors:change-lock-state', 721, true) 
                TriggerServerEvent('np-doors:change-lock-state', 720, true) 
            end
        end
    end
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "container_1" then
        container_1 = true
        Container1Craft()
        if exports['np-inventory']:hasEnoughOfItem('key1', 1) then
            exports['np-interface']:showInteraction("[E] Craft")
        end
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "container_1" then
        container_1 = false
        exports['np-interface']:hideInteraction()
    end
end)

function Container1Craft()
	Citizen.CreateThread(function()
        while container_1 do
            Citizen.Wait(5)
            if exports['np-inventory']:hasEnoughOfItem('key1', 1) then
			    if IsControlJustReleased(0, 38) then
                    TriggerEvent('server-inventory-open', '29', 'Craft')
                end
			end
		end
	end)
end

-- // Container 2 

Citizen.CreateThread(function()
    exports["np-polyzone"]:AddBoxZone("container_2", vector3(1005.51, -2483.87, 28.46), 2, 2, {
        name="container_2",
        heading=355,
        minZ=25.66,
        maxZ=29.66
	})
end)

local pDoorUnlocked2 = false
local container_2 = false

RegisterNetEvent('np-doors:unlockContainer2')
AddEventHandler('np-doors:unlockContainer2', function()
    local distance = #(vector3(1004.7822, -2495.068, 28.30051) - GetEntityCoords(PlayerPedId()))

    if exports['np-inventory']:hasEnoughOfItem('key2', 1) then
        if distance < 2 then
            if not pDoorUnlocked2 then
                pDoorUnlocked2 = true
                TriggerServerEvent('np-doors:change-lock-state', 748, false) 
                TriggerServerEvent('np-doors:change-lock-state', 747, false) 
            else
                pDoorUnlocked2 = false
                TriggerServerEvent('np-doors:change-lock-state', 748, true) 
                TriggerServerEvent('np-doors:change-lock-state', 747, true) 
            end
        end
    end
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
    if name == "container_2" then
        container_2 = true
        Container2Craft()
        if exports['np-inventory']:hasEnoughOfItem('key2', 1) then
            exports['np-interface']:showInteraction("[E] Craft")
        end
    end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "container_2" then
        container_2 = false
        exports['np-interface']:hideInteraction()
    end
end)

function Container2Craft()
	Citizen.CreateThread(function()
        while container_2 do
            Citizen.Wait(5)
            if exports['np-inventory']:hasEnoughOfItem('key2', 1) then
			    if IsControlJustReleased(0, 38) then
                    TriggerEvent('server-inventory-open', '35', 'Craft')
                end
			end
		end
	end)
end